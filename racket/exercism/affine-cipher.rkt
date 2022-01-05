#lang racket
(require racket/contract)
(require math/number-theory)

(provide (contract-out
          [encode (string?
                   exact-nonnegative-integer?
                   exact-nonnegative-integer? . -> . string?)]
          [decode (string?
                   exact-nonnegative-integer?
                   exact-nonnegative-integer? . -> . string?)]))

(define (insert-at lst c n)
  (if (<= (length lst) n)
      lst
      (append
       (append (take lst n) (list c))
       (insert-at (drop lst n) c n))))

(define (ascii->alpha msg)
  (map (lambda (c)
         (if (number? c)
             (- c 97)
             c))
       (map (lambda (c)
              (if (char-alphabetic? c)
                  (char->integer c)
                  c))
            (filter
             (lambda (c) (or (char-alphabetic? c) (char-numeric? c)))
             (string->list (string-downcase msg))))))

(define (alpha->ascii msg-list)
  (map (lambda (x)
         (if (number? x)
             (integer->char (+ x 97))
             x)) msg-list))

(define (encode msg a b)
  (if (coprime? a 26)
      (list->string
       (insert-at
        (alpha->ascii
         (map
          (lambda (x)
            (if (number? x)
                (modulo (+ (* a x) b) 26)
                x))
          (ascii->alpha msg)))#\space 5))
       (error "Error: a and m must be coprime.")))

(define (decode msg a b)
  (list->string
   (alpha->ascii
    (map
     (lambda (x)
       (if (number? x)
           (modulo (* (modular-inverse a 26) (- x b)) 26)
           x))
       (ascii->alpha msg)))))
