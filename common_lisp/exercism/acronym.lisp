(defpackage :acronym
  (:use :cl)
  (:export :acronym))

(in-package :acronym)

(defun acronym (string)
  (string-upcase (coerce
                  (loop
                    for prev = char
                    for char
                      across string
                    when (and
                          (alpha-char-p char)
                          (member prev '(nil #\- #\space)))
                      collect char)
                  'string)))
