(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defun is-valid-dna-p (str)
  (search str "GCTA"))

(defun transcribe (str)
    (if (is-valid-dna-p str)
      (let ((dna "GCTA")
        (rna "CGAU"))
        (string (char rna (search str dna))))
      (error "~S is not a valid nucleotide." str)))

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (format nil "~{~a~}"
    (loop
    for n
    across str
    collect (transcribe (string n)))))
