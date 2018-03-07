#lang racket

; based on the example in Realm of Racket https://nostarch.com/realmofracket

(define lower 1)
(define upper 100)

(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))

(define (guess)
  (quotient (+ lower upper) 2))

(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

(define (larger)
  (set! lower (min upper (add1 (guess))))
  (guess))
