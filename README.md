Make a simple debian package of [frp](https://github.com/fatedier/frp).

## Usage

### dpkg

#### Automated (GitHub Actions)

The repository includes a GitHub Actions workflow that automatically builds and publishes DEB packages to releases.

**Option 1: Manual trigger**
1. Go to the "Actions" tab in the GitHub repository
2. Select "Build and Release DEB Package" workflow
3. Click "Run workflow"
4. Enter the FRP version number (e.g., `0.64.0`)
5. The workflow will build the package and create a release

**Option 2: Tag-based trigger**
```shell
git tag v0.64.0
git push origin v0.64.0
```
The workflow will automatically build and publish the package.

**Download the package:**
Visit the [Releases](../../releases) page to download the built `.deb` package.

#### Manual build

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
