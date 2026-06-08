# bytestring-mmap-compat

A fork of [`bytestring-mmap`](https://hackage.haskell.org/package/bytestring-mmap)
that compiles against `unix >= 2.8`.

## Why this exists

The original `bytestring-mmap` (Don Stewart, last Hackage upload in
2011) calls `System.Posix.openFd` with the pre-2.8 four-argument
signature. Upstream is unmaintained, and the latest Hackage revision
caps the `unix` bound at `< 2.8`, which leaves the package unusable
in any package set that pulls in a newer `unix` transitively.

This fork:

  - Adds a tiny `System.Posix.IO.Compat` shim that selects the right
    `openFd` signature via CPP.
  - Widens the `unix` bound to cover both old and new signatures.
  - Modernises the cabal file (cabal-version 2.0, sensible base /
    bytestring bounds).

The public API (`System.IO.Posix.MMap`,
`System.IO.Posix.MMap.Lazy`) is byte-for-byte compatible with the
upstream; the only difference is the package name.

## When to switch back to upstream

When (or if) upstream adopts a compatible `openFd` call site, switch
your `build-depends` from `bytestring-mmap-compat` to `bytestring-mmap`
and remove this dependency. No source-level changes required.

## Credit

All non-trivial code is by Don Stewart. This fork only adds the
`Compat` shim and updates packaging metadata.

## License

BSD3; see `LICENSE`.
