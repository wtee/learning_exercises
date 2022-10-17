(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n &optional (steps '()))
  "Returns the number of steps to reach one, and the full list of steps."
  (and (> n 0)
       (if (or (= n 1) (= n 0))
           (values (length steps) (reverse steps))
           (if (oddp n)
               (collatz (1+ (* n 3)) (cons n steps))
               (collatz (/ n 2) (cons n steps))))))

(defun collatz-simple (n &optional (steps 0))
  "Returns the number of steps to reach 1."
  (and (> n 0)
       (if (or (= n 1) (= n 0))
           steps
           (if (oddp n)
               (collatz-simple (1+ (* n 3)) (1+ steps))
               (collatz-simple (/ n 2) (1+ steps))))))

(defun collatz-shortcutz (n &optional (steps 0))
  "Get to the end with a few less steps."
  (and (> n 0)
       (cond
         ((= n 1) steps)
         ;; The Collatz Conjecture ends with 160 80 20 10 5 16 8 4 2
         ;; or a subsequence thereof (always 16 8 4 2), so we can
         ;; skip some of those calculations at the cost of extra
         ;; checks each time around.
         ((= n 5) (+ 5 steps))
         ((= n 10) (+ 6 steps))
         ((= n 16) (+ 4 steps))
         ((= n 20) (+ 7 steps))
         ((= n 40) (+ 8 steps))
         ((= n 80) (+ 9 steps))
         ((= n 160 (+ 10 steps)))
         ;; The final step is always division by 2, so combine that with
         ;; each 3n+1
         ((oddp n) (collatz-shortcutz (/ (+ (* 3 n) 1) 2) (+ 2 steps)))
         (t (collatz-shortcutz (/ n 2) (1+ steps))))))
