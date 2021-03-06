#!/usr/bin/env bash

# Build Steps
# 1. update version number in `main.go` and `download.sh`
# 2. run this script
# 3. publish binaries on GitHub
# 4. push changes to GitHub
# 5. update AUR package

# more info at https://www.digitalocean.com/community/tutorials/how-to-build-go-executables-for-multiple-platforms-on-ubuntu-16-04

VERSION=$(go run main.go -v)

mkdir -p build
cd build

env GOOS=darwin GOARCH=amd64 go build -o gotop ../
tar czf gotop-$VERSION-darwin_amd64.tgz gotop
rm gotop

env GOOS=linux GOARCH=386 go build -o gotop ../
tar czf gotop-$VERSION-linux_386.tgz gotop
rm gotop

env GOOS=linux GOARCH=amd64 go build -o gotop ../
tar czf gotop-$VERSION-linux_amd64.tgz gotop
rm gotop
