#lang racket

(provide leap-year?)

(define (divides-evenly? a b)
  (= (remainder a b) 0))

(define (leap-year? year)
  (and (divides-evenly? year 4)
       (or (not (divides-evenly? year 100))
            (divides-evenly? year 400))))