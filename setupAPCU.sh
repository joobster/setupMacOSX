# Setup APCU to XAMPP for Mac OS X 10.9
#
# Requires brew package manager for OS X
# install brew:
# ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew install pcre

# for stable: pecl download apcu-4.0.2
/Applications/XAMPP/xamppfiles/bin/pecl download apcu

tar zxvf apcu-4.0.2.tgz
cd apcu-4.0.2
phpize

./configure --with-php-config=/Applications/XAMPP/xamppfiles/bin/php-config
make
sudo make install

# edit php.ini and add memcached extension
open -e /Applications/XAMPP/xamppfiles/etc/php.ini

# add extension=apcu.so