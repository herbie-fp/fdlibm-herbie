#lang racket/base

(require racket/system)
(require racket/list)

(provide installer)

;; Compiles fdlibm-pieces.c into a shared library placed next to
;; main.rkt, so the platform file can load it by its own location
;; regardless of whether the package is installed at user or system
;; scope.

(define (installer collections-top-path this-collection-path user-specific?)

  (define (call-and-wait command)
    (define out (process command))
    ((fifth out) 'wait)
    (unless (eq? ((fifth out) 'status) 'done-ok)
      (for ([line (in-lines (first out))])
        (displayln line (current-output-port)))
      (for ([line (in-lines (fourth out))])
        (displayln line (current-error-port)))
      (error 'fdlibm-accelerators "Error running ~a" command)))

  (define lib-name (path-replace-extension "fdlibm-pieces" (system-type 'so-suffix)))
  (define lib-location (build-path this-collection-path lib-name))
  (call-and-wait (string-append "gcc " (path->string (build-path this-collection-path "fdlibm-pieces.c"))
                                " -shared -o " (path->string lib-location))))
