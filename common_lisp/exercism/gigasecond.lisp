(defpackage :gigasecond-anniversary
  (:use :cl)
  (:export :from))
(in-package :gigasecond-anniversary)

(defun from (year month day hour minute second)
  (cdddr (reverse
   (multiple-value-list
     (decode-universal-time 
      (+ (expt 10 9)
       (encode-universal-time second minute hour day month year)))))))
