;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: BSD-3-Clause

;;;; cl-compat.asd - SBCL compatibility layer
;;;; Copyright (c) 2024-2026 Parkian Company LLC
;;;; License: BSD-3-Clause

(asdf:defsystem #:cl-compat
  :description "SBCL compatibility layer for threading, sockets, UUID, and UTF-8"
  :author "Park Ian Co"
  :license "Apache-2.0"
  :version "0.1.0"
  :serial t
  :components ((:file "package")
               (:module "src"
                :components ((:file "package")
                             (:file "conditions" :depends-on ("package"))
                             (:file "types" :depends-on ("package"))
                             (:file "cl-compat" :depends-on ("package" "conditions" "types")))))))

(asdf:defsystem #:cl-compat/test
  :description "Tests for cl-compat"
  :depends-on (#:cl-compat)
  :serial t
  :components ((:module "test"
                :components ((:file "test-compat"))))
  :perform (asdf:test-op (o c)
             (let ((result (uiop:symbol-call :cl-compat.test :run-tests)))
               (unless result
                 (error "Tests failed")))))
