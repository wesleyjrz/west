#!/bin/sh

nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
