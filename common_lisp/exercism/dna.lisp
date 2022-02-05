(in-package #:cl-user)

(defpackage #:rna-transcription
    (:use #:cl)
    (:export #:to-rna))

(in-package #:rna-transcription)

(defun transcribe (n)
    (or (cadr (assoc n '((#\G #\C) (#\C #\G) (#\T #\A) (#\A #\U))))
        (error "~S is not a valid nucleobase." n)))

(defun to-rna (dna)
    "Transcribe a string representing DNA nucleobases to RNA."
    (format nil "~{~a~}"
        (loop
        for n
        across dna
        collect (transcribe n))))