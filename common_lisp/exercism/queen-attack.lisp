(defpackage :queen-attack
  (:use :cl)
  (:export :valid-position-p
   :attackp))

(in-package :queen-attack)

(defun valid-position-p (coordinates)
  (let ((x (car coordinates)) (y (cdr coordinates)))
    (and (and (>= x 0) (< x 8))
         (and (>= y 0) (< y 8)))))

(defun attackp (white-queen black-queen)
  (let ((wx (car white-queen)) (wy (cdr white-queen))
        (bx (car black-queen)) (by (cdr black-queen)))
    (and (and (valid-position-p white-queen)
              (valid-position-p black-queen))
         (or (= wx bx) (= wy by) (= (abs (- wx bx)) (abs (- wy by)))))))
