#lang racket

; Have program handle guessing process without human intervention.

(define lower 1)
(define upper 100)
(define secret-number 50)

(define (start l u s)
  (set-lower-upper l u)
  (set-secret-number s)
  (guess-loop))

(define (set-lower-upper l u)
  (set! lower l)
  (set! upper u))

(define (set-secret-number n)
  (set! secret-number n))

(define (guess-loop)
  (define number-guessed (guess))
  (display (format "~a\n" number-guessed))
  (cond [(> secret-number number-guessed) (larger)]
        [(< secret-number number-guessed) (smaller)]
        [else (display "Correct!\n")]))

(define (guess)
  (quotient (+ lower upper) 2))

(define (smaller)
  (display "Smaller.\n")
  (set! upper (max lower (sub1 (guess))))
  (guess-loop))

(define (larger)
  (display "Larger.\n")
  (set! lower (min upper (add1 (guess))))
  (guess-loop))
