(in-package #:kp6-lisp)

(defclass kp6-cell ()
  ((value :initarg :value :accessor kp6-cell-value)))

(defun make-kp6-cell (value)
  (make-instance 'kp6-cell :value value))
