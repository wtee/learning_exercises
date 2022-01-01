#lang racket

(provide make-robot
         name
         reset!
         reset-name-cache!)

(define all-names (mutable-set))

(define (random-letter)
  (integer->char (random 65 91)))

(define (random-number)
  (integer->char (random 48 58)))

(define (generate-name)
  (list->string
   (list
    (random-letter)
    (random-letter)
    (random-number)
    (random-number)
    (random-number))))

(define (register-name! name)
  (set-add! all-names name)
  name)

(define/contract (make-robot)
  (-> string?)
  (let ([name (generate-name)])
    (if (not (set-member? all-names name))
        (register-name! name)
        (make-robot))))

(define/contract (reset! robot)
  (-> string? void?)
  (set! robot (make-robot)))

(define/contract (name robot)
  (-> string? string?)
  robot)

(define/contract (reset-name-cache!)
  (-> void?)
  (set-clear! all-names))
  