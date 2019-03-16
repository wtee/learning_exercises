(in-package :cl-user)

(defpackage :two-in-list-add-to
  (:use :common-lisp)
  (:use :lisp-unit)
  (:export :two-in-list-add-to))

(in-package :two-in-list-add-to)

(defun two-in-list-add-to (num-list num)
  "Tests if two numbers in a list add up to a given number.

   Args:
      - num-list (list): The list of integers to test.
      - num (integer): The integer to test.

   Returns: nil if no two numbers in the list add up to num
            otherwise returns a list containing the two numbers
            that add up to num.

   Example:
   ``(two-in-list-add-to ('(1 2 3) 5))``"

  (if (not num-list)
      nil
      (let ((find-me (- num (first num-list))))
        (if (member find-me (rest num-list))
            (list (first num-list) (first (member find-me (rest num-list))))
            (two-in-list-add-to (rest num-list) num)))))

(define-test test-positive
    "Test if two-in-list-add-to works with positive numbers."
  (let ((test-list '(1 1 2 3 5 8)))
    (assert-equal '(5 8) (two-in-list-add-to test-list 13))
    (assert-false (two-in-list-add-to test-list 400))))

(define-test test-negative
    "Test if two-in-list-add-to works with negative numbers."
  (let ((test-list '(1 2 -3 5 -10 50)))
    (assert-equal '(-3 -10) (two-in-list-add-to test-list -13))
    (assert-false (two-in-list-add-to test-list -400))))

(define-test test-dont-count-current-num
    "Test that two-in-list-add-to doesn't add a number from the list to itself."
  (let ((test-list '(1 3 4 5)))
    (assert-false (two-in-list-add-to test-list 2))))

(setq *print-failures* t)
(run-tests :all)

  
