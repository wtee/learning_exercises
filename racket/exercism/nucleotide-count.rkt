#lang racket

(provide nucleotide-counts)

(define/contract (nucleotide-counts dna)
  (-> string? list?)
  (for/fold ([counts '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0))])
            ([nucleotide (string->list dna)])
    (dict-update counts nucleotide add1)))
