Make a simple debian package of [frp](https://github.com/fatedier/frp).

## Usage

### dpkg

#### Automated (GitHub Actions)

The repository includes a GitHub Actions workflow that automatically checks for new FRP releases daily and builds DEB packages.

**Scheduled automatic builds:**
- The workflow runs daily at 00:00 UTC
- Checks the upstream FRP repository for new releases
- Automatically builds and publishes DEB packages if a new version is detected
- Skips building if the version has already been packaged

**Manual trigger (for testing):**
1. Go to the "Actions" tab in the GitHub repository
2. Select "Build and Release DEB Package" workflow
3. Click "Run workflow"
4. The workflow will check for the latest upstream release and build if needed

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
