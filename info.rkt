#lang info

(define collection "fdlibm-herbie")
(define deps '("base" ("herbie" #:version "2.3")))
(define install-collection "install.rkt")
(define compile-omit-files '("install.rkt"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib" ("herbie" #:version "2.3")))
(define pkg-desc "Herbie platform for fdlibm library components")
(define version "2.0")
(define pkg-authors '("Pavel Panchekha"))
