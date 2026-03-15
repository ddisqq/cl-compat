;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: Apache-2.0

(in-package #:cl-compat)

(define-condition cl-compat-error (error)
  ((message :initarg :message :reader cl-compat-error-message))
  (:report (lambda (condition stream)
             (format stream "cl-compat error: ~A" (cl-compat-error-message condition)))))
