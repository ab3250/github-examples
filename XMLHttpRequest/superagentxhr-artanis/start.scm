#! /usr/bin/env guile
!#
(use-modules
  (artanis artanis)
  (sxml simple)
  (ice-9 popen)
  (ice-9 q))

(init-server) 

(get "/" 
  (lambda ()
    (tpl->response "mainpage.html" )))

(post "/ajax" #:from-post 'qstr
  (lambda (rc)   
    (tpl->response (xml->sxml (string-append  "<btn>"(:from-post rc 'get "btn")"</btn>" )) )))

(run #:port 8080)


