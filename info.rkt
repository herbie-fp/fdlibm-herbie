#lang info

(define collection "fdlibm-herbie")
(define deps '("base"))
(define install-collection "install.rkt")
(define compile-omit-files '("install.rkt"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib" ("herbie" #:version "2.0")))
(define pkg-desc "Herbie plugin for fdlibm library components")
(define version "1.0")
(define pkg-authors '("Pavel Panchekha"))

(define herbie-plugin 'fdlibm-herbie)

