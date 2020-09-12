#! /usr/bin/env guile
!#
 
(use-modules  
  (web request)
  (web response)
  (sxml simple)
  (web http)
  (web server)
  (web uri)
  (ice-9 rdelim)
  (rnrs bytevectors)
  (ice-9 binary-ports))

(include "ab-library.scm" )

(define (page-handler request body)
  (cond
    ((string-rindex (car (request-path-components request)) #\.) ;if has ext
     (static-page request body))      
    ((equal? (request-path-components request) '("ajax")) ;if ajax call
      (respondXHR `(btn ,body)))   
    (else (not-found request))))
    
(run-server page-handler)






