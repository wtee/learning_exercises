#lang racket

(provide (contract-out
          [add-gigasecond (-> date? date?)]))

(require racket/date)

(define (add-gigasecond d)
  (seconds->date
   (+ (date->seconds d)
      (expt 10 9))))
