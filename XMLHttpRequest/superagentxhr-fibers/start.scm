#! /usr/bin/env guile
!#
 
(use-modules  
  (fibers web server)
  (web uri)
  (web request)
  (ice-9 rdelim)
  (web response)
  (sxml simple)
    (rnrs bytevectors) 
  (ice-9 binary-ports))

(include "ab-library.scm")

(define (page-handler request body)
  (cond
    ((string-rindex (car (request-path-components request)) #\.) ;if has ext
     (static-page request body))      
    ((equal? (request-path-components request) '("ajax")) ;if ajax call
      (respondXHR `(btn ,body)))   
    (else (not-found request))))
    
(run-server page-handler)






