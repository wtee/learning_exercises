(defpackage :armstrong-numbers
  (:use :cl)
  (:export :armstrong-number-p))
(in-package :armstrong-numbers)

(defun int-to-list (num)
  (map 'list #'parse-integer
       (map 'list (lambda (c) (string c)) (format nil "~a" num))))

(defun armstrong-number (number)
  (let* ((num-list (int-to-list number))
         (exponent (length num-list)))
    (apply #'+
           (loop
             for i in num-list
             collect (expt i exponent)))))

(defun armstrong-number-p (number)
  (= number (armstrong-number number)))
