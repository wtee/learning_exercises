#lang racket

; Allow the random number to be set in program. Expanded from 
; the example in Realm of Racket https://nostarch.com/realmofracket

(define lower 1)
(define upper 100)
(define secret-number 50)

(define (start l u s)
  (set-lower-upper l u)
  (set-secret-number s)
  (guess))

(define (set-lower-upper l u)
  (set! lower l)
  (set! upper u))

(define (set-secret-number n)
  (set! secret-number n))

(define (guess)
  (quotient (+ lower upper) 2))

(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

(define (larger)
  (set! lower (min upper (add1 (guess))))
  (guess))
