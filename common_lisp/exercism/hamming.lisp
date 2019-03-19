(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Calculate the number of positional differences, or Hamming distance,
   in two equal length dna strands."
<<<<<<< HEAD
  (cond
    ((not (eql (length dna1) (length dna2))) nil)
    ((eql 0 (length dna1)) 0)
    ((char= (char dna1 0) (char dna2 0))
      (distance (subseq dna1 1) (subseq dna2 1)))
    (t (+ 1 (distance (subseq dna1 1) (subseq dna2 1))))))

=======
  ;; If the strings are not the same length, return nil.
  (if (not (= (length dna1) (length dna2)))
      nil
      ;; If the strings are empty return 0.
      (cond ((eql 0 (length dna1)) 0)
            ;; If the two characters are the same, call distance on the
            ;; remaining string.
            ((eql (char dna1 0) (char dna2 0))
             (distance (subseq dna1 1) (subseq dna2 1)))
            ;; Otherwise, the characters are different, so return 1 plus
            ;; the result of calling distance on the remainder of the
            ;; string.
            (t (+ 1 (distance (subseq dna1 1) (subseq dna2 1)))))))
>>>>>>> e7dfa0ae2becc61460923c654d8271507fcf41e7
