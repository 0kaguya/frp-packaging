#!/bin/bash

[[ -d "$1" ]] || exit 1

cp -R files/* "$1" || exit 2
cp -R DEBIAN "$1" || exit 2

mkdir -p "$1/usr/bin"
mv "$1/frpc" "$1/usr/bin/" || exit 3
mv "$1/frps" "$1/usr/bin/" || exit 3

mkdir -p "$1/etc/frp"
mv "$1/frpc.toml" "$1/etc/frp/" || exit 3
mv "$1/frps.toml" "$1/etc/frp/" || exit 3

mv "$1/LICENSE" "$1/DEBIAN/copyright" || exit 3

dpkg-deb --build "$1"
