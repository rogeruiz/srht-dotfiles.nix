# Dot files Nix edition

So I've been curious about Nix for a while. Now that I've gotten a taste of it,
I'm going to be using Nix, Home Manager, Nixpkgs, & Nix Darwin to manage a
number of things from my operating system on Linux, packages on Darwin, and my
home directory across the two using the Nix language. I'll be writing some posts
around this topic in the future as well.

## Bootstrapping all this

When starting from scratch, you will need to have a couple of **required**
things installed before the stuff in this project are useful. For starters,
you'll need to have `nix` installed. Along with Nix, you'll need to have
`home-manager` installed as well. And if you're on macOS & not NixOS, you'll
need to have `nix-darwin` installed as well.

## Directory structure

This Nix repository uses Flakes to manage configuration for NixOS, Darwin, &
Home Manager. The Home Manager is done as a standalone so that I can avoid
having to build out the configuration for my OS separately from my home
directory files. There are also some files that aren't directly managed by Home
Manager and are documented separately.

This project also houses the Nix Shell configurations for various projects. Some
of these Nix files are also saved in another repository, but I keep copies here
as both a backup but to also continue learning, testing, and improving them.
