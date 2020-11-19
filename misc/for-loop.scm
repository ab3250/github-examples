(define for (lambda (start end func)
              (let loop ((index start))
                (if (> index end) #t
                    (begin (func index) (loop (+ index 1))) ))))

 ;(for 1 10 (lambda (x) (display x) (newline)))

 (for 1 10 
    (lambda (x)(for 1 10
      (lambda (y) (display x) (newline)))))