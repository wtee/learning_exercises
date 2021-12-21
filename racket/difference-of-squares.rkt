#lang racket

(provide (contract-out
          [sum-of-squares (-> number? any/c)]
          [square-of-sum (-> number? any/c)]
          [difference (-> number? any/c)]))

(define (difference n)
  (- (square-of-sum n) (sum-of-squares n)))

(define (sum-of-squares n)
  (+
   (/ (expt n 3) 3)
   (/ (expt n 2) 2)
   (/ n 6)))

(define (square-of-sum n)
  (expt (/ (* (+ n 1) n) 2) 2))
  

(define (sum-of-squares-naive n)
  (apply + (map (lambda (n) (expt (+ n 1) 2))
       (build-list n values))))

(define (square-of-sum-naive n)
  (expt (apply + (map
                  (lambda (n) (+ n 1))
                  (build-list n values))) 2))
