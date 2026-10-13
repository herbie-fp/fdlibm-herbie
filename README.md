# fdlibm-herbie

A [Herbie](https://herbie.uwplse.org/) platform that backs `log`,
`log1p`, and `log1pmd` with the correctly-rounded fdlibm
implementations from this package's `fdlibm-pieces` C library.

## Installing

```shell
raco pkg install fdlibm-herbie
```

Installing compiles `fdlibm-pieces.c` (requires a C compiler) into a
shared library next to the platform file.

## Using

Pass the installed platform file to Herbie with `--platform`:

```shell
herbie improve --platform <package-dir>/main.rkt input.fpcore output.fpcore
```

where `<package-dir>` is the package's installation directory (see
`raco pkg show fdlibm-herbie`).

The platform otherwise behaves like Herbie's default `racket`
platform. When the shared library cannot be loaded, it falls back to
Racket's own (less accurate) implementations.
