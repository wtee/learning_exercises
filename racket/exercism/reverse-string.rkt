#lang racket

(provide my-reverse)

(define (list-reverser lst)
  (if (empty? lst)
      lst
      (append (list-reverser (cdr lst)) (list (car lst)))))

(define/contract (my-reverse s)
  (-> string? string?)
  (list->string (list-reverser (string->list s))))

