(defpackage :proverb
  (:use :cl)
  (:export :recite))

(in-package :proverb)

(defun recite (strings)
  (if strings
      (format nil "~{~a~%~}~a"
              (loop
                for (a b) on strings
                if b
                  collect (format nil "For want of a ~a the ~a was lost." a b))
              (format nil "And all for the want of a ~a." (car strings)))
      ""))
