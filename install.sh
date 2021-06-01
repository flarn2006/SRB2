#!/bin/sh -ev
pushd src
make $*
popd
sudo install -Dm755 bin/Linux64/Release/lsdl2srb2 /usr/local/bin/srb2
sudo install -Dm644 src/sdl/SDL_icon.xpm /usr/local/share/pixmaps/srb2.xpm
