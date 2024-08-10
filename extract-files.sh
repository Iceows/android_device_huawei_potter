#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    
        odm/etc/camera/*.xml)
            sed -i 's/gb2312/UTF-8/g' "${2}"
            sed -i 's/GB2312/UTF-8/g' "${2}"
            sed -i 's/xmlversion/xml version/g' "${2}"
            sed -i 's/\"SkinWhiten/\" SkinWhiten/g' "${2}"
            iconv -f GB2312 -t UTF-8 -c -o ${2}.utf8 ${2}
            mv ${2}.utf8 ${2}
            tidy -quiet -asxml -xml -indent -wrap 0 -m --hide-comments 1 ${2}
            ;;
        odm/etc/camera/configeffect/quadra/*/raw_dpf.xml)
            sed -i 's/<gaus_sigm7>(.*)<\/gaus_sigm10>/<gaus_sigm7>(.*)<\/gaus_sigm7>/g' "${2}"
            sed -i 's/<gaus_sigm8>(.*)<\/gaus_sigm10>/<gaus_sigm8>(.*)<\/gaus_sigm8>/g' "${2}"
            sed -i 's/<gaus_sigm9>(.*)<\/gaus_sigm10>/<gaus_sigm9>(.*)<\/gaus_sigm79/g' "${2}"
            ;;
        odm/lib64/hwcam/hwcam.kirin710.m.POT.so)
            "${PATCHELF}" --replace-needed "libprotobuf-cpp-full.so" "libprotobuf-cpp-full-v29.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=potter
export DEVICE_COMMON=kirin710-9-common
export VENDOR=huawei

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
