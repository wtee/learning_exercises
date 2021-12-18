#lang racket

(provide rebase)

(define (rebase list-digits in-base out-base)
  (and
       (> in-base 1)
       (> out-base 1)
       (andmap (lambda (d)
                 (< -1 d in-base)) list-digits)
       (base10->number (number->base10 list-digits in-base) out-base)))

(define (number->base10 ns base)
  (let ([exponents (reverse (build-list (length ns) values))])
    (apply + (map (lambda (x)
           (* (car x) (expt base (cdr x))))
         (map cons ns exponents)))))

(define (base10->number ns base)
  (let-values ([(q r) (quotient/remainder ns base)])
    (if (= q 0)
        (list r)
        (flatten (list (base10->number q base) r)))))