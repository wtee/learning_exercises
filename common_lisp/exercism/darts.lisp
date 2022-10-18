(defpackage :darts
  (:use :cl)
  (:export :score))

(in-package :darts)

(defun score (x y)
  (let ((distance-from-center (sqrt (+ (* x x) (* y y)))))
    (cond
      ((<= distance-from-center 1) 10)
      ((<= distance-from-center 5) 5)
      ((<= distance-from-center 10) 1)
      (t 0))))
