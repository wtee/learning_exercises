(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defun expected-time-in-oven ()
  "The time it should take to bake the lasagna."
  337)

(defun remaining-minutes-in-oven (time-so-far)
  "The time the lasagna needs to bake, minus how long it has been baking."
  (- (expected-time-in-oven) time-so-far))

(defun preparation-time-in-minutes (layers)
  "The time it will take to assemble the lasagna's layers."
  (* 19 layers))

(defun elapsed-time-in-minutes (layers time-so-far)
  "How long it's taken to prepare the lasagna so far."
  (+ (preparation-time-in-minutes layers) time-so-far))
