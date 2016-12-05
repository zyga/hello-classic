# Hello Classic

This repository contains the raw source code of the first snap using *classic confinement*.

## About classic confinement

Classic confinement is a new feature that is under development for snapd 2.19.
It allows snaps coming from trusted sources to execute both without the
security sandbox and without the `pivot_root` to the core snap (aka kind-of
chroot).

## Building and testing

This snap cannot be built with _snapcraft_ just yet. For now just build it
manually with `make`.

## Installation

To install your new snap you need a not-yet-merged version of snapd and snap-confine. 

- https://github.com/snapcore/snapd/pull/2406
- https://github.com/snapcore/snap-confine/commits/classic-switch

Installation instructions for the branches above will be added shortly.

## Exploration

After you install the snap please inspect the file in
`/snap/hello-classic/current/hello-classic` with `ldd`. It is also useful to
use `snap run --shell hello-classic` and see what you can do from there and how
the classic environment looks like.
