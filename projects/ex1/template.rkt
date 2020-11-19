#lang r7rs
(import (scheme base)
        (scheme write)        
        (rnrs sorting-6)
        (scheme r5rs)
        (scheme private list)
        (srfi 27)
        (srfi 64)
        (srfi 42)        
        )
(include "../lib/srfi-197.sld")
(include "../lib/list.sld")


;(load "../lib/require.scm")

;(#%require "../lib/42.rkt")
;(#%require "../lib/27.rkt")
;(#%require "../lib/srfi-197.scm")
;(load "../lib/mitscheme.init")
;(#%require "../lib/%3a1.rkt")
(define lst '(3 5 6 7 0 4 6 2 3))
(display (-> (list-sort > lst) (reverse)(reverse)))
(filter)


(define (mply a b) 
(if (= b 0)
0
(+ a (mply a (- b 1)))))

;(display (mply 3 4))

(define-syntax for
  (syntax-rules (in as)
    ((for element in list body ...)
     (map (lambda (element)
            body ...)
          list))
    ((for list as element body ...)
     (map (lambda (element)
            body ...)
          list))))

(define-syntax while
  (syntax-rules ()
    ((while condition body ...)
     (let loop ()
       (if condition
           (begin
             body ...
             (loop))
           #f)))))

;(while (= 1 1)
 ; (display "hello world\n"))

(for i in '(0 1 2 3 4) (+ i 0))
;(for i fnord '(0 1 2 3 4) (display i))
;(for i some-other-keyword '(0 1 2 3 4) (display i))

(for '(0 1 2 3 4) as i
     (display i))

;(defmacro (when cond exp . rest)
; `(if ,cond
;     (begin ,exp . ,rest)))
