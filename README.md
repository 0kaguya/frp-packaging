Make a simple debian package of [frp](https://github.com/fatedier/frp).

## Usage

### dpkg

``` shell
version=0.64.0 # Replace with current version number
link="https://github.com/fatedier/frp/releases/download/v${version}/frp_${version}_linux_amd64.tar.gz"

curl -sSL -O "${link}"
tar -zxvf frp_${version}_linux_amd64.tar.gz

scripts/build-deb.sh frp_${version}_linux_amd64
sudo dpkg -i frp_${version}_linux_amd64.deb
```

### aur

#### Upgrade

``` shell
version=0.64.0 # Replace with current version number

gawk -v version="$version" -i inplace -F= \
    '/^pkgver/ { printf "%s=%s\n", $1, $version; next } { print }' \
    PKGBUILD

updpkgsums
```

#### Install

``` shell
makepkg -sic
```
