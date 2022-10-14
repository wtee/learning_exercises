(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (format nil "~[Pling~:;~]~[Plang~:;~]~[Plong~:;~]~@[~a~]"
          (rem n 3)
          (rem n 5)
          (rem n 7)
          (and (not (or
                     (zerop (mod n 3))
                     (zerop (mod n 5))
                     (zerop (mod n 7)))) n)))
