(defpackage :beer-song
  (:use :cl)
  (:export :verse :sing))

(in-package :beer-song)

(defun verse (n)
  "Returns a string verse for a given number."
  (format nil
          "~:[~a~;No more~] bottle~p of beer on the wall, ~:[~a~;no more~] bottle~p of beer.~%~:[Take ~:[one~;it~] down and pass it around, ~:[~a~;no more~]~;Go to the store and buy some more, 99~] bottle~p of beer on the wall.~%" 
          (zerop n) n
          n
          (zerop n) n
          n
          (zerop n)
          (= n 1)
          (= n 1)
          (- n 1)
          (- n 1)))

(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  (format nil "~{~a~%~}" (loop for n from start downto end by 1 collect (verse n))))
