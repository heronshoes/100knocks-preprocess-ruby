#!/usr/bin/env bash
set -e

APACHE_ARROW_VERSION=12.0.1-1
RBENV_RUBY=3.2.2

# Install Apache Arrow
arrow_dev_tmp=/tmp/apache-arrow-apt-source.deb
curl -sfSL -o ${arrow_dev_tmp} https://apache.jfrog.io/artifactory/arrow/ubuntu/pool/jammy/main/a/apache-arrow-apt-source/apache-arrow-apt-source_${APACHE_ARROW_VERSION}_all.deb
sudo apt-get install -y ${arrow_dev_tmp}
rm -f ${arrow_dev_tmp}
sudo apt-get update
sudo apt-get install -y \
        libarrow-dev \
        libarrow-glib-dev \
        libarrow-dataset-dev \
        libarrow-flight-dev \
        libparquet-dev \
        libparquet-glib-dev \
        libgandiva-dev \
        libgandiva-glib-dev

# Install rbenv
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
echo 'eval "$($HOME/.rbenv/bin/rbenv init -)"' >> $HOME/.profile
echo 'eval "$($HOME/.rbenv/bin/rbenv init -)"' >> $HOME/.bashrc
source $HOME/.profile
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build

# Install Ruby
# Append `RUBY_CONFIGURE_OPTS=--disable-install-doc ` before rbenv to disable documents
rbenv install --verbose $RBENV_RUBY
rbenv global $RBENV_RUBY
bundle install

# Install IRuby
gem install iruby
iruby register --force

# Install language and set timezone
# You should change here if you use another
sudo apt-get update
sudo apt-get install -y language-pack-ja

echo 'export LANG=ja_JP.UTF-8' >> $HOME/.bashrc
echo 'export LANG=ja_JP.UTF-8' >> $HOME/.profile
echo 'export TZ=Asia/Tokyo' >> $HOME/.bashrc
echo 'export TZ=Asia/Tokyo' >> $HOME/.profile

# Install HaranoAjiFonts
mkdir -p $HOME/.fonts
git clone https://github.com/trueroad/HaranoAjiFonts.git $HOME/.fonts/HaranoAjiFonts
