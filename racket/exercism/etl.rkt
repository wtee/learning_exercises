#lang racket

(provide etl)

(define/contract (etl scores)
  (-> (hash/c positive-integer? (listof string?)) 
      (hash/c string? positive-integer?))
  (make-hash (append*
              (hash-map scores
                        (lambda (score letters)
                          (map (lambda (l)
                                 (cons (string-downcase l)
                                       score)) letters))))))
