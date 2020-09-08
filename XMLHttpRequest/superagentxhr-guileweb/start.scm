#! /usr/bin/env guile
!#
(use-modules
  (artanis artanis)
  (sxml simple)
  (web http)
  (web server)
  (web request)
  (web response)
  (web uri)
  (sxml simple)
  (ice-9 rdelim)
  (rnrs bytevectors)
  (ice-9 arrays)
)
(include "ab-library.scm")

(define (page-handler request body)
(display (request-path-components request))
  (cond
    ((equal? (request-path-components request) '())
      (values '((content-type . (text/plain))) "Hello hacker!"))
    ((equal? (request-path-components request) '("two"))
      (static-page request body))
    ((equal? (request-path-components request) '("ajax-script.js"))
      (static-page2 request body))
    ((equal? (request-path-components request) '("superagent.js"))
      (static-page3 request body))
    ((equal? (request-path-components request) '("ajax"))
       (respondXHR
          `(btn ,body)))   
    (else (not-found request))))
(run-server page-handler)






