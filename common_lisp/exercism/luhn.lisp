(in-package #:cl-user)
(defpackage #:luhn
  (:use #:cl)
  (:export #:is-valid))

(in-package #:luhn)

(defun is-long-enough (input)
  (< 1 (length input)))
  
(defun is-divisible-by-10 (num)
  (= 0 (mod num 10)))

(defun is-all-numerals (input)
  (loop
    for c in (coerce input 'list)
    always (digit-char-p c)))

(defun sum (num-list)
  (reduce #'+ num-list))

(defun luhn-double (num)
  (let ((double-num (* 2 num)))
    (if (< 9 double-num) (- double-num 9) double-num)))

(defun luhn-double-every-other (nums)
  (loop 
    for c in (reverse (coerce nums 'list))
      for i below (length nums)
        if (oddp i) 
          collect (luhn-double (digit-char-p c)) 
        else
          collect (digit-char-p c)))

(defun is-valid (input)
  (let ((clean-input (remove #\Space input)))
    (if (and (is-long-enough clean-input)
             (is-all-numerals clean-input))
      (let ((nums-to-sum (luhn-double-every-other clean-input)))
        (if (is-divisible-by-10 (sum nums-to-sum))
          nums-to-sum)))))
