#lang racket

(provide collatz)

(define (solver n)
  (cond
    [(= n 1) '()]
    [(even? n) (cons 1 (solver (/ n 2)))]
    [(odd? n) (cons 1 (solver (+ (* n 3) 1)))]))

(define/contract (collatz n)
  (-> exact-positive-integer? exact-nonnegative-integer?)
  (length (solver n)))

  

