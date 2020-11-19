#lang sicp
(define num 600851475143)

(define (isPrime? x)
  (cond [(<= x 3) (> x 1)]
        [(or (zero? (modulo x 2))(zero? (modulo x 3))) false]
        [ else (let loop ([i 5])
                   (if (<= (* i i) x)
                     (if (or (zero?(modulo x i)) (zero?(modulo x (+ i 2)))) false  (loop (+ i 6)))  
                     true
                   )
               )] 
  )
)

(define (rng cnt lst) (if (<= (* cnt cnt) num)
                          (rng (inc cnt) (if (and(zero?(modulo num cnt))(isPrime? cnt))
                                             (append lst (list cnt))
                                              lst))
                          (display lst))
  )

(rng 1 '())


;;600851475143
;;(71 839 1471 6857)

