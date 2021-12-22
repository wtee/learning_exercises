#lang racket

(provide (contract-out [response-for (-> string? any/c)]))

(define (yelling? words)
  (and (equal? (string-upcase words) words)
       (not (empty? (filter
                    (lambda (c)
                      (char-alphabetic? c))
                    (string->list words))))))

(define (question? words)
  (string-suffix? words "?"))

(define (silence? words)
  (= (string-length (string-normalize-spaces words)) 0))

(define (response-for words)
  (cond
    [(silence? words) "Fine. Be that way!"]
    [(question? words)
     (if (yelling? words)
         "Calm down, I know what I'm doing!"
         "Sure.")]
    [(yelling? words) "Whoa, chill out!"]
    [else "Whatever."]))
