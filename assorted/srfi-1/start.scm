(use-modules (srfi srfi-1)(ice-9 receive))
(newline)
;(display (first '(4 8)))(newline)
;;;;;;(display (caar '(4 4 5 8)))(newline) no
; (display (take '(4 5 6 7 8 0 1 9 ) 4 ))(newline) ;return first 4
; (display (drop '(4 5 6 7 8 0 1 9 ) 4 ))(newline) ;return rest after first 4
; (display (take-right '(4 5 6 7 8 0 1 9 ) 4 ))(newline) ;return last 4
; (display (drop-right '(4 5 6 7 8 0 1 9 ) 4 ))(newline) ;return all but last 4

;(display (split-at '(4 5 6 7 8 0 1 9 ) 4 ))(newline) 

; (receive (first-part last-part) (split-at '(4 5 6 7 8 0 1 9 ) 4 )
; (newline) 
; (display first-part)
; (display " and ")
; (display last-part))
;************************************************************************************************
; (receive (odds evens)
;     (partition odd? '(7 4 2 8 3))
;   (display odds)
;   (display " and ")
;   (display evens))

;************************************************************************************************
;Scheme Procedure: call-with-values producer consumer
    ;Calls its producer argument with no values and a continuation that, when passed some values,
    ;calls the consumer procedure with those values as arguments.
    ;The continuation for the call to consumer is the continuation of the call to call-with-values.

; (call-with-values (lambda () (values 4 5))
;                   (lambda (a b) 
;                    (display a)
;                    (display " and ")
;                    (display b)))
;************************************************************************************************
;https://www.gnu.org/software/guile/manual/html_node/Continuations.html

(define (foo)
  (display "hello\n")
  (display (bar)) (newline)
  (exit))
;The continuation from the call to bar comprises a display of the value returned, a newline and an exit. This can be expressed as a function of one argument.

(lambda (r)
  (display r) (newline)
  (exit))
  (foo)