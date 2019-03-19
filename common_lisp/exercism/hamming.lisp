(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Calculate the number of positional differences, or Hamming distance,
   in two equal length dna strands."
  (cond
    ((not (eql (length dna1) (length dna2))) nil)
    ((eql 0 (length dna1)) 0)
    ((char= (char dna1 0) (char dna2 0))
      (distance (subseq dna1 1) (subseq dna2 1)))
    (t (+ 1 (distance (subseq dna1 1) (subseq dna2 1))))))

