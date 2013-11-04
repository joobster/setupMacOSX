# Setup brewed PYTHON for Mac OS X 10.9!
# 
# Requires brew package manager for OS X
# install brew:
# ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
# additional info: https://github.com/mxcl/homebrew/wiki/installation

brew install python --with-brewed-openssl

# if still shows /usr/bin/python
which python

# we need to add brewed python path before /usr/bin DO NOT OVERRIDE it, it is higly not recommended
sudo echo export PATH="/usr/local/bin:$PATH" >> ~/.bash_profile
# brew link --overwrite python

# /usr/local/bin/python
which python

# install python sphinx
pip install sphinx

# additional packages
# http://openalea.gforge.inria.fr/wiki/doku.php?id=documentation:developper:release:macosx

# set up some taps and update brew
brew tap homebrew/science # a lot of cool formulae for scientific tools
brew tap samueljohn/python # numpy, scipy
brew update && brew upgrade

# install openblas (otherwise scipy's arpack tests will fail)
brew install openblas
 
# install PIL, imagemagick, graphviz and other
# image generating stuff (qt is nice for viewing)
brew install pillow imagemagick graphviz
brew install qt sip pyqt
 
pip install nose sphinx pyparsing dateutils
 
# install numpy and scipy
brew install numpy --with-openblas
brew install scipy --with-openblas
brew install matplotlib