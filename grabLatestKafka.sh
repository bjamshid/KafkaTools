#!/usr/bin/env bash

dist_page="https://www-us.apache.org/dist/kafka/"
version=$(curl -s https://www-us.apache.org/dist/kafka/ | cut -d\" -f6 | grep ".\." | tail -n1 | sed "s/.$//")
build_version=$(wget -qO- https://www-us.apache.org/dist/kafka/$version | grep "$version.tgz" | cut -d\" -f6 | head -1)
url="$dist_page$version/$build_version"

echo ""
echo "latest version of Apache Kafka is $version at $url"
echo -e "Downloading to $PWD $(tput setaf 10) \n"
wget "$url"
echo "un-taring the package"
tar -xzf $build_version
echo "removing tar package"
rm $build_version
echo -e "\nDone!"
echo ""
