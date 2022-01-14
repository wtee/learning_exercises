#lang racket

(provide encode decode)

(define/contract (insert-at lst c n)
  (-> list? char? positive-integer? list?)
  (if (<= (length lst) n)
      lst
      (append
       (append (take lst n) (list c))
       (insert-at (drop lst n) c n))))

(define/contract (map-letters text code-hash)
  (-> string? hash? list?)
  (map
   (lambda (c)
     (hash-ref code-hash c c))
     (filter
      (lambda (c)
        (or (char-alphabetic? c)
            (char-numeric? c)))
      (string->list (string-downcase text)))))

(define/contract (encode m)
  (-> string? string?)
  (let ([encipher
  (make-hash
   (map cons
       (string->list "abcdefghijklmnopqrstuvwxyz")
       (string->list "zyxwvutsrqponmlkjihgfedcba")))])
  (list->string
   (insert-at
    (map-letters m encipher) #\space 5))))

(define/contract (decode m)
  (-> string? string?)
  (let ([decipher
  (make-hash
   (map cons
       (string->list "zyxwvutsrqponmlkjihgfedcba")
       (string->list "abcdefghijklmnopqrstuvwxyz")))])
  (list->string (map-letters m decipher))))
