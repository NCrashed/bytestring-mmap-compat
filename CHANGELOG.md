# Changelog

## 0.2.3  2026-06-08

Initial release of `bytestring-mmap-compat`, forked from
`bytestring-mmap-0.2.2` on Hackage.

  - Adds `System.Posix.IO.Compat` shim so the package compiles
    against `unix >= 2.8` (whose `openFd` lost the `Maybe FileMode`
    argument).
  - Widens the `unix` bound to `>= 2.7 && < 2.9`.
  - Modernises the cabal file: `cabal-version: 2.0`, explicit
    `default-language: Haskell2010`, explicit base / bytestring
    bounds.
  - Public API unchanged from upstream 0.2.2.
  - Dropped `-O2` from `ghc-options` (a per-package `-O2` is rarely
    a real win on a thin FFI wrapper and burns compile time on
    every downstream user; the hot path is in `cbits/`).
