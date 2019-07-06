#lang racket

(provide two-fer)

(require racket/contract)

(define/contract (two-fer [name "you"])
  (() (string?) . ->* . string?)
  (format "One for ~a, one for me." name))