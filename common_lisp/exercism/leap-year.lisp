(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  (and (div-by-p year 4)
       (or (not (div-by-p year 100))
           (div-by-p year 400))))

(defun div-by-p (x y)
  (= 0 (mod x y)))
               
