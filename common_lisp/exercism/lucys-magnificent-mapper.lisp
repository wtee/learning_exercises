(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun make-magnificent-maybe (func num-list)
  (mapcar func num-list))

(defun only-the-best (func num-list)
  (remove-if func (remove 1 num-list)))