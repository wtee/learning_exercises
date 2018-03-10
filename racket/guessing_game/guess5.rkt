#lang racket

; The secret number is chosen randomly. Guesses are made at random
; between the upper and lower limits. This code is expanded from
; code in Realm of Racket https://nostarch.com/realmofracket

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
  (cond [(> secret number-guessed) (larger lower upper secret number-guessed)]
        [(< secret number-guessed) (smaller lower upper secret number-guessed)]
        [else (display "Correct!\n")]))

(define (guess lower upper)
  (random lower (add1 upper)))

(define (smaller lower upper secret guessed)
  (display "Smaller.\n")
  (set! upper guessed)
  (guess-loop lower upper secret))

(define (larger lower upper secret guessed)
  (display "Larger.\n")
  (set! lower guessed)
  (guess-loop lower upper secret))
