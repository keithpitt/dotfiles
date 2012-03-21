build_package_combined_patch() {
  local package_name="$1"

  {
    curl https://github.com/ruby/ruby/pull/47.diff | git apply
    curl https://raw.github.com/gist/1859082/performance_and_backport_gc.patch | patch -p1
    autoconf
    ./configure --prefix="$PREFIX_PATH" $CONFIGURE_OPTS
    make -j 8
    make install
  } >&4 2>&1

}

require_gcc
install_package "yaml-0.1.4" "http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz"
install_package "ruby-1.9.3-p125" "http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz" combined_patch