# CMake module replacements for Tegra CUDA builds

This repository contains replacements for the old-style
FindCUDA.cmake module and its helpers for use in cross-building
CUDA applications for Jetson systems using Yocto Project/OpenEmbedded
build tools.

They are direct copies from upstream CMake sources with
minor modifications that fix issues with cross builds:

* Upstream FindCUDA.cmake attempts to invoke the C compiler
  with modified flags, which fails in the OE build environment.

* Recent JetPack releases containing CUDA 10.2 package the
  libcublas library differently from earlier releases.

Even though CMake's FindCUDA module has been deprecated in favor
of CUDA language support and the FindCUDAToolkit module for some
time, many applications still use FindCUDA.
