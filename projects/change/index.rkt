#lang r7rs
(import (scheme base)
        (scheme write)        
        (rnrs sorting-6)
        )
;;
#|
0 0 0 0 0
0 0 0 0 1 - 99 Cents
0 0 0 1 0 - 20 c5
0 0 0 1 1 - 
0 0 1 0 0
0 0 1 0 1
0 0 1 1 0
0 0 1 1 1
0 1 0 0 0
0 1 0 0 1
0 1 0 1 0
0 1 0 1 1
0 1 1 0 0
0 1 1 0 1
0 1 1 1 0
0 1 1 1 1
1 0 0 0 0
1 0 0 0 1
1 0 0 1 0
1 0 0 1 1
1 0 1 0 0
1 0 1 0 1
1 0 1 1 0
1 0 1 1 1
1 1 0 0 0
1 1 0 0 1
1 1 0 1 0
1 1 0 1 1
1 1 1 0 0
1 1 1 0 1
1 1 1 1 0
1 1 1 1 1

|#
(define coins '(1 5 10 25 50))
(define (changeOpts amtDue)(+ amtDue 1))


(display (changeOpts 12))
(display coins)

