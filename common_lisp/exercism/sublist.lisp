(defpackage :sublist
  (:use :cl)
  (:export :sublist))

(in-package :sublist)

(defun sublistp (list1 list2)
  (when (<= (length list1) (length list2))
    (if (equal list1 (subseq list2 0 (length list1)))
        t
        (sublistp list1 (cdr list2)))))

(defun sublist (list1 list2)
  "what is list1 of list2 (sublist, superlist, equal or unequal)"
  (cond
    ((equal list1 list2) :equal)
    ((sublistp list1 list2) :sublist)
    ((sublistp list2 list1) :superlist)
    (t :unequal)))
