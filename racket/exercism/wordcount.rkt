#lang racket

(provide word-count)

(define/contract (trim-quotes text)
  (-> string? string?)
  (string-trim text "'"))

(define/contract (token-count t lst)
  (-> string? list? cons?)
  (cons t (count (lambda (token)
           (equal? t token)) lst)))

(define/contract (word-count text)
  (-> string? hash?)
  (let ([tokens
        (map trim-quotes
         (filter non-empty-string?
                 (regexp-split #rx"[\t\t\n ,.?!@#$%^&*-+=\\|:;\"<>/]"
                               (string-downcase text))))])
  (make-hash
    (map (lambda (t) 
           (token-count t tokens)) tokens))))