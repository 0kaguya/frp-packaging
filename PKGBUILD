pkgname=frp-bin
pkgver=0.64.0
pkgrel=1
pkgdesc='Fast Reverse Proxy'
arch=('x86_64' 'aarch64')
url='https://github.com/fatedier/frp'
license=('Apache-2.0')
depends=()
conflicts=(frp)
options=(!debug)
source=("local::git+file://$(pwd)")
source_x86_64=("https://github.com/fatedier/frp/releases/download/v${pkgver}/frp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/fatedier/frp/releases/download/v${pkgver}/frp_${pkgver}_linux_arm64.tar.gz")

package() {
    if [[ $CARCH = 'x86_64' ]]; then
	carch='amd64'
    elif [[ $CARCH = 'aarch64' ]]; then
	carch='arm64'
    else
	exit 9
    fi

    cd $srcdir/frp_${pkgver}_linux_${carch}
    for file in $(find -regex '.*frp[cs]\.toml$'); do
	install -Dm644 $file $pkgdir/etc/frp/$file
    done
    for file in $(find -regex '.*frp[cs]$'); do
	install -Dm755 $file $pkgdir/usr/bin/$file
    done

    cd $srcdir/local/files
    for file in $(find); do
	[[ -f $file ]] && install -D $file $pkgdir/$file
    done
}

sha256sums=('SKIP')
sha256sums_x86_64=('d422aa5f8c775513171ed8b30139ed1a2a7b3bb4649112830b8100ac20774c56')
sha256sums_aarch64=('f8c3f194a45df7dd7b37d1041cbfddc7d6eb13c130509e49ad55d291c6a1b482')
