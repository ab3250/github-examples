(define count 999)

(define (find-palindrome)
           (let outer ((o count))
               (if (eq? o 0)
                   (begin
                     (display "done"))
                   (begin
                      (let inner ((i count))
                        (if (eq? i 0)
                            (begin
                              (outer (- o 1)) )
                            (begin
                              (if  (string=? (number->string(* i o)) (list->string (reverse (string->list(number->string(* i o))))))
                                  (begin
                                    (display i)
                                    (display " ")
                                    (display o)
                                    (display " ")
                                    (display (* i o))
                                    (newline)))
                                  (inner (- i 1)))))))))

(find-palindrome)
;;90909