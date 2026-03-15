;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: Apache-2.0

(in-package #:cl-compat)

;;; Core types for cl-compat
(deftype cl-compat-id () '(unsigned-byte 64))
(deftype cl-compat-status () '(member :ready :active :error :shutdown))
