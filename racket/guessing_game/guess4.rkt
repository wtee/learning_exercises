#lang racket

; Have the program select the secret number. Get rid of global variables.
; This code is an expansion of code found in Realm of Racket https://nostarch.com/realmofracket

(define (start)
  (define lower 1)
  (define upper-list (build-list 5 (lambda (x) (expt 10 (+ 1 x)))))
  (define upper (first (shuffle upper-list)))
  (define secret (random lower (add1 upper)))
  (display (format "The secret number is ~a between ~a and ~a.\n" secret lower upper))
  (guess-loop lower upper secret))

(define (guess-loop lower upper secret)
  (define number-guessed (guess lower upper))
  (display (format "~a\n" number-guessed))
  (cond [(> secret number-guessed) (larger lower upper secret)]
        [(< secret number-guessed) (smaller lower upper secret)]
        [else (display "Correct!\n")]))

(define (guess lower upper)
  (quotient (+ lower upper) 2))

(define (smaller lower upper secret)
  (display "Smaller.\n")
  (set! upper (max lower (sub1 (guess lower upper))))
  (guess-loop lower upper secret))

(define (larger lower upper secret)
  (display "Larger.\n")
  (set! lower (min upper (add1 (guess lower upper))))
  (guess-loop lower upper secret))
