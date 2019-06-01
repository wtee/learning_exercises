(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun trim-whitespace (input)
  (let ((whitespace '(#\Backspace #\Linefeed #\Newline #\Page #\Return #\Rubout #\Space #\Tab)))
    (string-trim whitespace input))) 

(defun last-char= (input test-char)
  (if (< 0 (length input))
      (char= (char input (- (length input) 1)) test-char)))

(defun silent-treatment-p (input)
  (= 0 (length input)))

(defun yelling-p (input)
  (and (string= input (string-upcase input))
       (not (string= input (string-downcase input)))))

(defun question-p (input)
  (last-char= input #\?))

(defun yelling-question-p (input)
  (and (yelling-p input) (question-p input)))

(defun response-for (input)
  (let ((clean-input (trim-whitespace input)))
    (cond
      ((silent-treatment-p clean-input) "Fine. Be that way!")
      ((yelling-question-p clean-input) "Calm down, I know what I'm doing!")
      ((yelling-p clean-input) "Whoa, chill out!")
      ((question-p clean-input) "Sure.")
      (t "Whatever."))))

