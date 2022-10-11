(defpackage :pal-picker
  (:use :cl)
  (:export :pal-picker :habitat-fitter :feeding-time-p
           :pet :play-fetch))

(in-package :pal-picker)

(defun pal-picker (personality)
  (case personality
    (:lazy "Cat")
    (:energetic "Dog")
    (:quiet "Fish")
    (:hungry "Rabbit")
    (:talkative "Bird")
    (otherwise "I don't know... A dragon?")))

(defun habitat-fitter (weight)
  (cond
    ((>= weight 40) :massive)
    ((>= 39 weight 20) :large)
    ((>= 19 weight 10) :medium)
    ((>= 9 weight 1) :small)
    ((>= 0 weight) :just-your-imagination)))

(defun feeding-time-p (fullness)
  (if (<= fullness 20)
      "It's feeding time!"
      "All is well."))

(defun pet (pet)
  (when (equal pet "Fish") "Maybe not with this pet..."))

(defun play-fetch (pet)
  (unless (equal pet "Dog")  "Maybe not with this pet..."))
