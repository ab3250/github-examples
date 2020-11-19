(define count 999)
(define (find-palindrome)
           (let outer ((o count)(lst '()))
               (if (eq? o 0)
                   (begin
                     (display (apply max lst)))
                   (begin
                      (let inner ((i count)(lst lst))
                        (if (eq? i 0)
                            (begin
                              (outer (- o 1) lst ))
                            (begin
                              (if  (string=? (number->string(* i o)) (list->string (reverse (string->list(number->string(* i o))))))
                                   (inner (- i 1) (append lst (list(* i o))))
                                   (inner (- i 1) lst )))))))))

(find-palindrome)
;;906609