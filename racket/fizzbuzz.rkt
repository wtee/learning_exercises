#lang racket

(define (divisible-by-3? n)
  (= 0 (modulo n 3)))

(define (divisible-by-5? n)
  (= 0 (modulo n 5)))

(define (fizzbuzz num-list)
  (if (empty? num-list)
    empty
    (let ([n (first num-list)])
      (cons 
        (cond 
          [(and (divisible-by-3? n) 
            (divisible-by-5? n)) "fizzbuzz"]
          [(divisible-by-3? n) "fizz"]
          [(divisible-by-5? n) println "buzz"]
          [n])
      (fizzbuzz (rest num-list))))))