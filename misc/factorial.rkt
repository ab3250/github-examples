
 #lang sicp
(define (fact n)
  (define (fact-helper n acc)
    (if (zero? n) acc
      (fact-helper (- n 1)
                   (* n acc))))
  (fact-helper n 1))

(fact 100000)

