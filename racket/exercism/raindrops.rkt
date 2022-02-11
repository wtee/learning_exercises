(provide convert)

(define/contract (convert n)
  (-> integer? string?)
  (let ([raindrops
    (string-join 
      (filter string? 
        (list 
          (if (zero? (modulo n 3)) "Pling" n)
          (if (zero? (modulo n 5)) "Plang" n)
          (if (zero? (modulo n 7)) "Plong" n))) "")])
  (if (equal? ""  raindrops)
    (number->string n)
    raindrops))