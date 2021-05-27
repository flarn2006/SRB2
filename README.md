# Sonic Robo Blast 2

[![Build status](https://ci.appveyor.com/api/projects/status/399d4hcw9yy7hg2y?svg=true)](https://ci.appveyor.com/project/STJr/srb2)
[![Build status](https://travis-ci.org/STJr/SRB2.svg?branch=master)](https://travis-ci.org/STJr/SRB2)
[![CircleCI](https://circleci.com/gh/STJr/SRB2/tree/master.svg?style=svg)](https://circleci.com/gh/STJr/SRB2/tree/master)

[Sonic Robo Blast 2](https://srb2.org/) is a 3D Sonic the Hedgehog fangame based on a modified version of [Doom Legacy](http://doomlegacy.sourceforge.net/).

## About this fork
This is my (flarn2006) personal version, containing some changes I made for my own purposes, mainly related to console commands. I'm putting this out here in case anyone else wants to use it, but be aware, a lot of these changes are done in a quick-and-dirty way, and there are some bugs which I may or may not fix when and if I get tired of dealing with them. That said, here are the changes I've made:

- The `loadstring` function has been added to Lua. I've also included a script, `repl.lua`, which uses this to provide a REPL-like interface via a `lua` console command.

- A `sudo` console command, which does what you'd imagine it does if you're familiar with its namesake. More specifically, it temporarily sets `devparm` to true, and `multiplayer` and `netgame` to false, before executing a command, then restores their previous values afterwards. It also sets a flag which I can reference in other parts of the code to add additional command-specific overrides.

- Typing `these_arent_the_mods_youre_looking_for` in the console will clear the "game modified" command if it is set.

- Specifying the `-legit` option for `addfile` will import the file without flagging the game as modified. (Notice a recurring theme here? :P) This is useful in `autoexec.cfg`, if you still want the flag to be set when you use `-file`.

- Changing skin color now works even when you're moving, though it might cause glitches with some characters, including [my own](https://mb.srb2.org/addons/sparks-the-scarf-rider.2807/).

## Dependencies
- NASM (x86 builds only)
- SDL2 (Linux/OS X only)
- SDL2-Mixer (Linux/OS X only)
- libupnp (Linux/OS X only)
- libgme (Linux/OS X only)
- libopenmpt (Linux/OS X only)

## Compiling

See [SRB2 Wiki/Source code compiling](http://wiki.srb2.org/wiki/Source_code_compiling)

## Disclaimer
Sonic Team Junior is in no way affiliated with SEGA or Sonic Team. We do not claim ownership of any of SEGA's intellectual property used in SRB2.

I (flarn2006) take no responsibility for any damage to your save data or computer. In addition, while this version does allow you to use arbitrary mods in multiplayer games, I don't condone doing so in a manner that violates the rules of the server you're playing on. If you choose to do so anyway, you take sole responsibility for the consequences of your actions.
