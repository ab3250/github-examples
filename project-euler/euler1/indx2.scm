#lang sicp
(define (rng cnt lst) ( if (not(eq? cnt 1000))                          
                           (rng (+ cnt 1) (if (or (zero? (modulo cnt 3)) (zero? (modulo cnt 5)))
                                              (append lst (list cnt))
                                              lst)
                                          )
                           (apply + lst)                          
                           )
)
(rng 0 '())