#lang r7rs

;(load "simple-macros.scm")
;(load "simple-syntax-case.scm")

    
(let-syntax for-times
  (lambda (iterate state . body)
    (let ((iterator (first iterate))
          (iterations (second iterate))
          (name (first state))
          (value (second state)))
      `(let loop ((,iterator 0)
                  (,name ,value))
         (if (< ,iterator ,iterations)
             (loop (+ ,iterator 1) (begin ,@body))
             ,name)))))

(iterate 10 (lambda(x)(display x)))