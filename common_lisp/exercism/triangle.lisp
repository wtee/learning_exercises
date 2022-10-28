(defpackage :triangle
  (:use :cl)
  (:export :triangle-type-p))

(in-package :triangle)

(defun triangle-p (a b c)
  (and (not (and (zerop a) (zerop b) (zerop c)))
       (and (>= (+ a b) c) (>= (+ b c) a) (>= (+ a c) b))))

(defun triangle-type-p (type a b c)
  "Deterimines if a triangle (given by side lengths A, B, C) is of the given TYPE"
  (when (triangle-p a b c)
    (or
     (and (eq type :equilateral) (= a b c))
     (and (eq type :isosceles) (or (= a b) (= b c) (= a c)))
     (and (eq type :scalene) (not (or (= a b) (= b c) (= a c)))))))
