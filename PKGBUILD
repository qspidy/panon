pkgname=panon-git
pkgver=0.1.0
pkgrel=1
pkgdesc="X"
arch=('any')
url="http://github.com/rbn42/panon"
license=('MIT')
depends=('python-xlib' 'python-ewmh' 'python-gobject' 'python-numpy' 'python-pyaudio' 'python-psutil' 'wmctrl' 'pamixer') 
makedepends=('git')
provides=('panon')
conflicts=('panon')
source=("$pkgname::git+https://github.com/rbn42/panon")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

