
 #lang sicp
;;; validate-step validates whether a given step is a valid one.
(define validate-step
  (lambda (step)
    (let ((s
           (cond
             ((and (list? step) (not (null? step))) (car step))
             ((and (list? step) (null? step)) 1)
             ((string? step) (string->number step))
             ((integer? step) step))))
      (if (integer? s)
          (if (= s 0) (error "step cannot be zero") s)
          (error 'validate-step "invalid step given" s)))))

;;; range creates a sequence of integer values from min to max with the given step.
;;;
;;; Note: the code below does not validate range input, e.g. (range 1 10 -1) is invalid
(define range
  (lambda (min max . step)
    (let ((step (validate-step step)))
      (if (< min max)
          (cons min (range (+ min step) max step))
          '()))))
(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst))
         (cons (car lst) (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))
(define (meets? x) (or (zero? (modulo x 3)) (zero? (modulo x 5))))

(apply +(filter  meets? (range 1 1000 1)))
