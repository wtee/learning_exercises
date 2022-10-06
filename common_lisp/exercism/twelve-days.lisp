(defpackage :twelve-days
  (:use :cl)
  (:export :recite))

(in-package :twelve-days)

(defun verse (day)
  (let* ((gifts
           '("a Partridge in a Pear Tree" "two Turtle Doves" "three French Hens"
             "four Calling Birds" "five Gold Rings" "six Geese-a-Laying"
             "seven Swans-a-Swimming" "eight Maids-a-Milking" "nine Ladies Dancing"
             "ten Lords-a-Leaping" "eleven Pipers Piping" "twelve Drummers Drumming"))
         (additional-gifts (reverse (subseq gifts 1 day))))
    (format nil "On the ~:R day of Christmas my true love gave to me: ~@[~{~a, ~}and ~]~a."
            day
            additional-gifts
            (car gifts))))

(defun recite (&optional begin end)
  (format nil "~{~a~^~%~}"
          (loop
            for i
            from (or begin 1)
              to (or end begin 12)
            collect (verse i))))
