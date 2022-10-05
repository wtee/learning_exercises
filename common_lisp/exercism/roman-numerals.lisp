(defpackage :roman-numerals
  (:use :cl)
  (:export :romanize))

(in-package :roman-numerals)

(defun integer-to-list (number)
  (map 'list #'digit-char-p 
       (coerce (format nil "~a" number) 'list)))

(defun romanize (number)
  "Returns the Roman numeral representation for a given number."
  (let ((numerals (make-array '(4 10) :initial-contents 
                              '(("" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX")
                                ("" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC")
                                ("" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM")
                                ("" "M" "MM" "MMM" "" "" "" "" "" ""))))
        (places (reverse (integer-to-list number))))
       (format nil "~{~A~}" (loop
                             for i
                             from (- (length places) 1) downto 0
                             collect (aref numerals i (nth i places))))))