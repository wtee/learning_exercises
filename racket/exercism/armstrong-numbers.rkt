#lang racket

(provide armstrong-number?)

(define/contract (armstrong-number? n)
  (-> integer? boolean?)
  (let* ([number-list (map (lambda (n) (string->number (string n)))
                     (string->list (number->string n)))]
         [exponent (length number-list)])
    (= n (apply + (map (lambda (i) (expt i exponent)) number-list)))))
         
