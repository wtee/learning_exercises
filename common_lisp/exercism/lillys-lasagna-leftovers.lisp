(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defun preparation-time (&rest layers)
  (* 19 (length layers)))

(defun remaining-minutes-in-oven (&optional (duration nil duration-supplied-p))
  (let ((base-time 337))
       (if (and (null duration) duration-supplied-p)
           0
           (case duration
             ((:shorter) (- base-time 100))
             ((:very-short) (- base-time 200))
             ((:longer) (+ base-time 100))
             ((:very-long) (+ base-time 200))
             (otherwise base-time)))))

(defun split-leftovers (&key (weight nil weight-supplied-p) (alien 10) (human 10))
  (cond
    ((not (null weight)) (- weight alien human))
    ((and (null weight) weight-supplied-p) :looks-like-someone-was-hungry)
    ((null weight) :just-split-it)))