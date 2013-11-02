# Setup MEMCACHED to XAMPP for Mac OS X 10.9!
# 
# Requires brew package manager for OS X
# install brew:
# ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew install autoconf
brew install autoheader
brew install memcached
brew install libmemcached

# check Version !!
sudo ln -s /usr/local/Cellar/autoconf/2.69/bin/autoconf /usr/bin/autoconf
sudo ln -s /usr/local/Cellar/autoheader/2.69/bin/autoheader /usr/bin/autoheader

# install memcached extension

/Applications/XAMPP/xamppfiles/bin/pecl download memcached
# (or whatever version downloads)
tar zxvf memcached-1.0.0.tgz
cd memcached-1.0.0
phpize

# For 10.9 (Mavericks) (Issue: https://github.com/php-memcached-dev/php-memcached/issues/69#issuecomment-17051990)
# edit php_lib_memcached_compat.h and add:
# typedef const struct memcached_server_st *memcached_server_instance_st;

./configure --with-php-config=/Applications/XAMPP/xamppfiles/bin/php-config --with-libmemcached-dir=/usr/local/Cellar/libmemcached/1.0.17
make
sudo make install

# edit php.ini and add memcached extension
open -e /Applications/XAMPP/xamppfiles/etc/php.ini

# add extension=memcached.so