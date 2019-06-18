#lang racket

(provide square total)

(define (square n)
  (if (= 1 n) 1
    (* 2 (square (- n 1)))))

(define (total)
  (for/sum ([n (in-range 1 65)])
    (square n)))