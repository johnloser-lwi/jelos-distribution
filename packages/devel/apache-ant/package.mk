# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Peter Vicman (peter.vicman@gmail.com)
# Copyright (C) 2020-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="apache-ant"
PKG_VERSION="1.10.12"
PKG_LICENSE="Apache License 2.0"
PKG_SITE="https://ant.apache.org/"
PKG_URL="https://archive.apache.org/dist/ant/source/${PKG_NAME}-${PKG_VERSION}-src.tar.xz"
PKG_DEPENDS_HOST="jdk-zulu:host"
PKG_LONGDESC="Apache Ant is a Java library and command-line tool that help building software."
PKG_TOOLCHAIN="manual"

make_host() {
  (
  export JAVA_HOME=$(get_build_dir jdk-zulu)

  ./bootstrap.sh
  ./bootstrap/bin/ant -f fetch.xml -Ddest=optional
  ./build.sh -Ddist.dir=${PKG_BUILD}/binary dist
  )
}

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/bin
    cp binary/bin/ant ${TOOLCHAIN}/bin
    cp -r binary/lib ${TOOLCHAIN}
}
