(define (handler request request-body)
  (values response response-body))

(define (request-path-components request)
  (split-and-decode-uri-path (uri-path (request-uri request))))

(define (not-found request)
  (values (build-response #:code 404)
          (string-append "Resource not found: "
                         (uri->string (request-uri request)))))

(define (templatize title body)
  `(html (head (title ,title))
         (body ,@body)))




(define* (respond #:optional body #:key
  (status 200)
  (title "Hello hello!")
  (doctype "<!DOCTYPE html>\n")
  (content-type-params '((charset . "utf-8")))
  (content-type 'text/html)
  (extra-headers '())
  (sxml (and body (templatize title body))))

(values (build-response
           #:code status
           #:headers `((content-type
                        . (,content-type ,@content-type-params))
                       ,@extra-headers))
          (lambda (port)
            (if sxml
                (begin
                  (if doctype (display doctype port))
                  (sxml->xml sxml port))))))



(define (mime-type-ref file-name)
  (let* ((dot-position (string-rindex file-name #\.))
         (extension (and dot-position
                         (string-copy file-name (+ dot-position 1))))
         (mime-type (and dot-position
                         (hash-ref *mime-types* extension))))
    (if mime-type mime-type '("application" . "octet-stream"))))

(define (mime-type-symbol mime-type)
  (string->symbol (string-append (car mime-type) "/" (cdr mime-type))))

(define (text-mime-type? mime-type)
  (if (equal? (car mime-type) "text") #t #f))

; (define-module (glider mime-types)
;   :export (mime-type-ref text-mime-type? mime-type-symbol))

; (define *mime-types* (make-hash-table 31))
; (hash-set! *mime-types* "css" '("text" . "css"))
; (hash-set! *mime-types* "txt" '("text" . "plain"))
; (hash-set! *mime-types* "png" '("image" . "png"))
; (hash-set! *mime-types* "jpg" '("image" . "jpeg"))
; (hash-set! *mime-types* "jpeg" '("image" . "jpeg"))
; (hash-set! *mime-types* "gif" '("image" . "gif"))

(define (static-page request body)
(let ((file-path "mainpage.html")(request request)(body body))
          (if (file-exists? file-path)
              (let* ((mime-type '("text" . "html"))
                     (mime-type-symbol (mime-type-symbol mime-type)))
                (if (text-mime-type? mime-type)
                    (values
                     `((content-type . (,mime-type-symbol)))
                     (lambda (out-port)
                       (call-with-input-file file-path
                         (lambda (in-port)
                           (display (read-delimited "" in-port)
                                                    out-port)))))
                    (values
                     `((content-type . (,mime-type-symbol)))
                     (call-with-input-file file-path
                         (lambda (in-port)
                           (get-bytevector-all in-port))))))
              (not-found request))))


(define (static-page2 request body)
(let ((file-path "ajax-script.js")(request request)(body body))
          (if (file-exists? file-path)
              (let* ((mime-type '("text" . "javascript"))
                     (mime-type-symbol (mime-type-symbol mime-type)))
                (if (text-mime-type? mime-type)
                    (values
                     `((content-type . (,mime-type-symbol)))
                     (lambda (out-port)
                       (call-with-input-file file-path
                         (lambda (in-port)
                           (display (read-delimited "" in-port)
                                                    out-port)))))
                    (values
                     `((content-type . (,mime-type-symbol)))
                     (call-with-input-file file-path
                         (lambda (in-port)
                           (get-bytevector-all in-port))))))
              (not-found request))))

(define (static-page3 request body)
(let ((file-path "superagent.js")(request request)(body body))
          (if (file-exists? file-path)
              (let* ((mime-type '("text" . "javascript"))
                     (mime-type-symbol (mime-type-symbol mime-type)))
                (if (text-mime-type? mime-type)
                    (values
                     `((content-type . (,mime-type-symbol)))
                     (lambda (out-port)
                       (call-with-input-file file-path
                         (lambda (in-port)
                           (display (read-delimited "" in-port)
                                                    out-port)))))
                    (values
                     `((content-type . (,mime-type-symbol)))
                     (call-with-input-file file-path
                         (lambda (in-port)
                           (get-bytevector-all in-port))))))
              (not-found request))))



(define* (respondXHR #:optional body #:key
  (status 200)
  (content-type-params '((charset . "utf-8")))
  (content-type 'text/html)
  (extra-headers '())
  (sxml body))

(values (build-response
           #:code status
           #:headers `((content-type
                        . (,content-type ,@content-type-params))
                       ,@extra-headers))
          (lambda (port)
            (if sxml
                (begin                 
                  (sxml->xml body port))))))

(define (pump-port in-port out-port)
  (let ([buffer (make-bytevector 65536)])
    (let loop ()
      (let ([count (get-bytevector-n! in-port buffer 0 65536)])
        (when (not (eof-object? count))
          (put-bytevector out-port buffer 0 count)
          (loop))))))