(defpackage :beer-song
  (:use :cl)
  (:export :verse :sing))

(in-package :beer-song)

(defun verse (n)
  "Returns a string verse for a given number."
  (let ((n-formatted (if (zerop n) "No more" (write-to-string n)))
        (es1 (if (= n 1) "" "s"))
        (do-what 
          (cond
            ((> n 1) "Take one down and pass it around")
            ((= n 1) "Take it down and pass it around")
            ((zerop n) "Go to the store and buy some more")))
        (new-n (cond 
                 ((= n 1) "no more")
                 ((zerop n) 99)
                 (t (- n 1))))
        (es2 (if (= n 2) "" "s")))
  (format nil "~a bottle~a of beer on the wall, ~a bottle~a of beer.~%~a, ~a bottle~a of beer on the wall.~%" n-formatted es1 (string-downcase n-formatted) es1 do-what new-n es2)))
     
(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  (format nil "~{~a~%~}" (loop for n from start downto end by 1 collect (verse n))))