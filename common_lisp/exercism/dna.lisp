(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defun only-one-nucleotide-p (str)
  (= 1 (length str)))

(defun is-valid-dna-p (str)
  (search str "GCTA"))

(defun transcribe (str)
  (let ((dna "GCTA")
        (rna "CGAU"))
    (string (char rna (search str dna)))))

(defun one-to-rna (str)
  (if (is-valid-dna-p str)
    (transcribe str)
    (error "~S is not a valid nucleotide." str)))

(defun many-to-rna (str)
  (format nil "~{~a~}"
    (loop
    for n
    across str
    collect (one-to-rna (string n)))))

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
    (if (only-one-nucleotide-p str)
      (one-to-rna str)
      (many-to-rna str)))
