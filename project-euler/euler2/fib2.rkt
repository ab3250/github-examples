
#lang sicp
(define (fib prev1 prev2)
 ( cond [(< prev1 4000000)
      (begin
        (display prev1)
        (newline)
        (fib prev2 (+ prev1 prev2))
      )]
      [#t (begin
            (display prev1)
            (newline)
            )]
  )
 )

(fib 0 1)