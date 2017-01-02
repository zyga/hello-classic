# Hello Classic

This repository contains the raw source code of the first snap using *classic confinement*.

## About classic confinement

Classic confinement is a new feature that is under development for snapd 2.19.
It allows snaps coming from trusted sources to execute both without the
security sandbox and without the `pivot_root` to the core snap (aka kind-of
chroot).

## Building and testing

Ensure that you have snapcraft version at least 2.24 (run `snapcraft --version`
to check). To build the snap just run `snapcraft`.

## Installation

Install this snap just as any regular snap. If built locally please use `snap
install --dangerous --classic hello-classic_*.snap`. Note the presence of
`--classic` switch. This switch tells snapd that you allow this snap to be
installed with classic confinement.

## Exploration

After you install the snap please inspect the file in
`/snap/hello-classic/current/hello-classic` with `ldd`. It is also useful to
use `snap run --shell hello-classic` and see what you can do from there and how
the classic environment looks like.

## Theory

This snap contains one dynamically linked C executable, `hello-classic`. The
executable uses the dynamic linker and runtime libraries from the core snap. It
is totally independent of the classic distribution with the exception that the
kernel and provided snapd need to be recent enough to support this construct.

Unlike regular snaps the classic snap has full access to the file system of the
classic distribution.

## Ideas

You can use classic snaps to package your shell, your toolchain, your brand new
tool or your clunky internal script that you've been sharing with your
colleagues.
