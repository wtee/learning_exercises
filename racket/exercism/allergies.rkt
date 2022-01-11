#lang racket

(require math/number-theory)

(provide list-allergies allergic-to?)

(define scores-allergies '((128 "cats")
                           (64 "pollen")
                           (32 "chocolate")
                           (16 "tomatoes")
                           (8 "strawberries")
                           (4 "shellfish")
                           (2 "peanuts")
                           (1 "eggs")))

(define/contract (list-allergies score [sa scores-allergies])
  (-> number? list?)
  (if (not (empty? sa))
      (if (< score (caar sa))
          (list-allergies score (cdr sa))
          (let-values ([(q r) (quotient/remainder score (caar sa))])
            (if (odd? q)
                (if (not (zero? r))
                    (append (cdar sa) (list-allergies r (cdr sa)))
                    (cdar sa))
                (list-allergies r (cdr sa)))))
      '()))
      
(define/contract (allergic-to? str score)
  (-> string? number? boolean?)
  (if (member str (list-allergies score))
      #t #f))

