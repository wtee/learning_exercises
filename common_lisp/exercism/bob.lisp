(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun all-caps-p (input)
  (and (string= input (string-upcase input))
       (not (string= input (string-downcase input)))))

(defun last-char= (input test-char)
  (if (< 0 (length input))
      (char= (char input (- (length input) 1)) test-char)))

(defun trim-whitespace (input)
  (let ((whitespace '(#\Backspace #\Linefeed #\Newline #\Page #\Return #\Rubout #\Space #\Tab)))
    (string-trim whitespace input))) 

(defun response-for (input)
  (let ((clean-input (trim-whitespace input)))
    (cond
      ((= 0 (length clean-input)) "Fine. Be that way!")
      ((and (all-caps-p clean-input) (last-char= clean-input #\?))
       "Calm down, I know what I'm doing!")
      ((all-caps-p clean-input) "Whoa, chill out!")
      ((last-char= clean-input #\?) "Sure.")
      (t "Whatever."))))

