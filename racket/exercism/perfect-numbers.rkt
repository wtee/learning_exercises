#lang racket

(provide (contract-out
          [classify (-> number? symbol?)]))

(define (factor? a b)
  (zero? (modulo a b)))

(define (find-factors n)
  (let ([small-factors
         (stream->list
          (stream-filter
           (lambda (i) (factor? n i))
           (in-range 1 (+ (integer-sqrt n) 1))))])
     (remove-duplicates
       (append small-factors
       (reverse
        (map
        (lambda (i) (quotient n i))
        small-factors))))))

(define (aliquot-sum n)
  (- (apply + (find-factors n)) n))

(define (classify n)
  (let ([a (aliquot-sum n)])
  (cond
    [(= a n) 'perfect]
    [(> a n) 'abundant]
    [else 'deficient])))