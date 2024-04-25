#lang racket/base

(require herbie/plugin 
         ffi/unsafe)

(eprintf "Loading fdlibm-accelerators...\n")
(module test racket/base)

(define log.fdlibm (get-ffi-obj "log" "fdlibm-pieces" (_fun _double -> _double)))
(define log1p.fdlibm (get-ffi-obj "log1p" "fdlibm-pieces" (_fun _double -> _double)))
(define log1pmd.fdlibm (get-ffi-obj "log1pmd" "fdlibm-pieces" (_fun _double -> _double)))

#;(define-accelerator-impl log log.fdlibm (binary64) binary64 log.fdlibm)
#;(define-accelerator-impl log1p log1p.fdlibm (binary64) binary64 log1p.fdlibm)

(module+ main
  (writeln (log.fdlibm 1.1))
  (writeln (log1p.fdlibm 0.1))
  (writeln (log1pmd.fdlibm 0.1)))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html
