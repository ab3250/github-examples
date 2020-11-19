(define (sum-proc term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum-proc term
                      (next a)
                      next
                      b))))

(define (identity a) a)

(define (inc a) (+ a 1))

(define (square a) (* a a))

(define (inc2 x)
        (inc (inc x)))

(display (sum-proc identity 1 inc 5))(newline) ;15

(display (sum-proc square 1 inc 3))(newline) ;14

(display (sum-proc square 2 inc 3))(newline) ;13


(display (sum-proc identity 2 inc2 10))(newline) ;30


(display (sum-proc square 2 inc2 10))(newline) ;220