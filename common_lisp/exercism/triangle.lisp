(defpackage :triangle
  (:use :cl)
  (:export :triangle-type-p))

(in-package :triangle)

(defun triangle-p (a b c)
  (> (+ a b c) (* 2 (max a b c))))

(defun triangle-type-p (type a b c)
  "Deterimines if a triangle (given by side lengths A, B, C) is of the given TYPE"
  (when (triangle-p a b c)
    (or
     (and (eq type :equilateral) (= a b c))
     (and (eq type :isosceles) (or (= a b) (= b c) (= a c)))
     (and (eq type :scalene) (and (/= a b) (/= b c) (/= a c))))))
