(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun to-decimal (list-digits in-base)
  (let 
   ((exponents (reverse 
                (loop 
                 for n from 0 to (1- (length list-digits))
                 collect n))))
   (reduce '+ (map 'list (lambda (d e) (* d (expt in-base e)))
        list-digits
        exponents))))

(defun from-decimal (decimal-number out-base)
  (multiple-value-bind (q r) (truncate decimal-number out-base)
    (if (zerop q)
        (list r)
        (append (from-decimal q out-base) (list r)))))
  
(defun rebase (list-digits in-base out-base)
  (and (> in-base 1)
       (> out-base 1)
       (not (or (find-if 'minusp list-digits)
                 (find-if (lambda (n) (>= n in-base)) list-digits)))
      (from-decimal (to-decimal list-digits in-base) out-base)))
