#lang racket

(provide hamming-distance)

(define/contract (hamming-distance strand-1 strand-2)
  (-> string? string? exact-nonnegative-integer?)
   (count
    (negate equal?)
      (string->list strand-1)
      (string->list strand-2)))
  