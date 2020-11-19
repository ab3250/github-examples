;;Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
#lang sicp

(#%require "../lib/lists.rkt")
(#%require "../lib/sorting-6.rkt")


(define (square z) (* z z))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define list-head
  (lambda (ls n)
    (if (= n 0)
        '()
        (cons (car ls) (list-head (cdr ls) (- n 1))))))



(define inputList '(4 2 9))
(define a (list-sort > inputList))
(define b (take a 2))
(define c (car b))
(define d (car (reverse b)))
(define e (sum-of-squares c d))
;;(define c (sum-of-squares (car b) (cdr b)))
;;(define r (+ 1 b))

(display e)
  
