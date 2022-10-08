(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (odds-evens n)
  (if (oddp n)
      (cons (cons n (car odds-evens)) (cdr odds-evens))
      (cons (car odds-evens) (cons n (cdr odds-evens)))))

;; Define partition-numbers function
(defun partition-numbers (num-list)
  (reduce #'categorize-number num-list :initial-value '(nil)))