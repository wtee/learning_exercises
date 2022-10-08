(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string)
  (subseq log-string 8))

(defun log-severity (log-string)
  (let ((status (string-downcase (subseq log-string 1 5))))
    (cond
      ((string= "ohno" status) :run-for-cover)
      ((string= "warn" status) :getting-worried)
      ((string= "info" status) :everything-ok))))

(defun log-format (log-string)
  (let ((message (log-message log-string)))
  (case (log-severity log-string)
    (:run-for-cover (string-upcase message))
    (:getting-worried (string-capitalize message))
    (:everything-ok (string-downcase message)))))