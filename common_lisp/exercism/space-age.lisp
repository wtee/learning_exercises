(defpackage :space-age
  (:use :cl)
  (:export :on-mercury
   :on-venus
           :on-earth
   :on-mars
           :on-jupiter
   :on-saturn
           :on-uranus
   :on-neptune))

(in-package :space-age)

(defun on-earth (age)
  (/ age 31557600))

(defun on-mercury (age)
  (/ (on-earth age)  0.2408467))

(defun on-venus (age)
  (/ (on-earth age) 0.61519726))

(defun on-mars (age)
  (/ (on-earth age) 1.8808158))

(defun on-jupiter (age)
  (/ (on-earth age) 11.862615))

(defun on-saturn (age)
  (/ (on-earth age) 29.447498))

(defun on-uranus (age)
  (/ (on-earth age) 84.016846))

(defun on-neptune (age)
  (/ (on-earth age) 164.79132))
