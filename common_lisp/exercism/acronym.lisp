(defpackage :acronym
  (:use :cl)
  (:export :acronym))

(in-package :acronym)

(defun find-next-letter (str)
  (let ((space (position #\Space str)) (hyphen (position #\- str)))
    (if (or space hyphen)
        (+ 1 (if (and space hyphen)
                 (if (< space hyphen)
                     space
                     hyphen)
                 (or space hyphen)))
        nil)))

(defun get-letters (str acc)
  (let ((next-letter (find-next-letter str)))
    (if next-letter
        (if (alpha-char-p (char str next-letter))
            (get-letters (subseq str next-letter) (cons (char str next-letter) acc))
            (get-letters (subseq str (+ 1 next-letter)) acc))
        acc)))

(defun acronym (str)
  "Returns the acronym for a noun of tech jargon."
   (if (zerop (length str))
       str
       (let*
         ((trimmed-str (string-trim " " str))
          (first-letter (char trimmed-str 0)))
       (string-upcase
          (format nil "~{~a~}"
                  (cons first-letter (reverse (get-letters (subseq trimmed-str 1) '()))))))))

