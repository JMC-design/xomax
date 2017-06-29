;;; -*- Log: code.log; Package: extensions -*-
;;;
;;; **********************************************************************
;;; This code was written as part of the CMU Common Lisp project at
;;; Carnegie Mellon University, and has been placed in the public domain.
;;; If you want to use this code or any part of CMU Common Lisp, please contact
;;; Scott Fahlman or slisp-group@cs.cmu.edu.
;;;
;;; **********************************************************************
;;;
;;; This file contains an interface to internet domain sockets.
;;;
;;; Written by William Lott.
;;;


(defpackage :unix
  (:use :common-lisp)
  (:export
   :unix-socket
   :get-unix-error-msg
   :unix-connect
   :unix-close
   :unix-bind
   :unix-listen
   :unix-accept
   :unix-recv
   :unix-send))


(defpackage :c
  (:use :common-lisp)
  (:export
   :*backend*
   :backend
   :backend-byte-order))

(defpackage :extensions
  (:use :common-lisp)
  (:export
   :*after-gc-hooks* 
   :*after-save-initializations*
   :*all-modifier-names*
   :*backup-extension*
   :*before-gc-hooks*
   :*before-save-initializations*
   :*block-compile-default*
   :*bytes-consed-between-gcs*
   :*char
   :*clx-fds-to-displays*
   :*command-line-strings*
   :*command-line-switches*
   :*command-line-utility-name*
   :*command-line-words*
   :*command-switch-demons*
   :*compatibility-warnings*
   :*compile-progress*
   :*derive-function-types*
   :*describe-implementation-details*
   :*describe-indentation*
   :*describe-level*
   :*describe-print-length*
   :*describe-print-level*
   :*describe-verbose*
   :*display-event-handlers*
   :*editor-lisp-p*
   :*efficiency-note-cost-threshold*
   :*efficiency-note-limit*
   :*enclosing-source-cutoff*
   :*environment-list*
   :*error-print-length*
   :*error-print-level*
   :*gc-inhibit-hook*
   :*gc-notify-after*
   :*gc-notify-before*
   :*gc-verbose*
   :*hemlock-version*
   :*ignore-floating-point-underflow*
   :*info-environment*
   :*intexp-maximum-exponent*
   :*keyword-package*
   :*lisp-package*
   :*load-if-source-newer*
   :*max-old-trace-indentation*
   :*max-step-indentation*
   :*max-trace-indentation*
   :*module-file-translations*
   :*prompt*
   :*require-verbose*
   :*setf-fdefinition-hook*
   :*top-level-auto-declare*
   :*undefined-warning-limit*
   :accept-tcp-connection
   :add-oob-handler
   :ambiguous-files
   :argument-list
   :assq
   :basic-definition
   :bignump
   :bitp
   :cache-hash-eq
   :call-user-miscop
   :cancel-finalization
   :careful-symbol-function
   :carefully-add-font-paths
   :char
   :char-key-event
   :clean-up-compiler
   :clear-info
   :clear-search-list
   :close-socket
   :cmd-switch-arg
   :cmd-switch-name
   :cmd-switch-string
   :cmd-switch-value
   :cmd-switch-words
   :collect
   :command-line-switch
   :command-line-switch-p
   :compact-info-environment
   :compile-from-stream
   :compiledp
   :complete-file
   :concat-pnames
   :connect-to-inet-socket
   :constant
   :constant-argument
   :constant-function
   :create-inet-listener
   :create-inet-socket
   :debug
   :def-source-context
   :default-clx-event-handler
   :default-directory
   :define-clx-modifier
   :define-hash-cache
   :define-info-class
   :define-info-type
   :define-key-event-modifier
   :define-keyboard-modifier
   :define-keysym
   :define-mouse-code
   :define-mouse-keysym
   :defmodule
   :defswitch
   :defun-cached
   :deletef
   :delq
   :disable-clx-event-handling
   :do-alpha-key-events
   :do-anonymous
   :do-info
   :double-float-negative-infinity
   :double-float-positive-infinity
   :double-floatp
   :dovector
   :e
   :enable-clx-event-handling
   :encapsulate
   :encapsulated-definition
   :encapsulated-p
   :end-block
   :enumerate-search-list
   :file-comment
   :file-writable
   :finalize
   :fixnump
   :float-denormalized-p
   :float-infinity-p
   :float-nan-p
   :float-trapping-nan-p
   :floating-point-inexact
   :floating-point-invalid
   :flush-display-events
   :format-decoded-time
   :format-universal-time
   :freeze-type
   :gc
   :gc-off
   :gc-on
   :get-bytes-consed
   :get-code-pointer
   :get-command-line-switch
   :get-data-pointer
   :get-floating-point-modes
   :get-stream-command
   :grindef
   :host-entry
   :host-entry-addr
   :host-entry-addr-list
   :host-entry-aliases
   :host-entry-name
   :htonl
   :htons
   :inaddr-any
   :indenting-further
   :info
   :inhibit-warnings
   :interactive-eval
   :ipproto-tcp
   :ipproto-udp
   :iterate
   :key-event
   :key-event-bit-p
   :key-event-bits
   :key-event-bits-modifiers
   :key-event-char
   :key-event-keysym
   :key-event-modifier-mask
   :key-event-p
   :keysym-names
   :keysym-preferred-name
   :letf
   :letf*
   :listen-skip-whitespace
   :load-foreign
   :long-float-negative-infinity
   :long-float-positive-infinity
   :long-floatp
   :lookup-host-entry
   :make-case-frob-stream
   :make-info-environment
   :make-key-event
   :make-key-event-bits
   :make-stream-command
   :make-weak-pointer
   :maybe-inline
   :memq
   :name-keysym
   :ntohl
   :ntohs
   :object-set-event-handler
   :old-trace
   :old-untrace
   :once-only
   :open-clx-display
   :optimize-interface
   :parse-time
   :print-directory
   :print-herald
   :print-pretty-key
   :print-pretty-key-event
   :process-alive-p
   :process-close
   :process-core-dumped
   :process-error
   :process-exit-code
   :process-input
   :process-kill
   :process-output
   :process-p
   :process-pid
   :process-plist
   :process-pty
   :process-status
   :process-status-hook
   :process-wait
   :putf
   :quit
   :ratiop
   :read-char-no-edit
   :realp
   :remove-all-oob-handlers
   :remove-oob-handler
   :required-argument
   :reset-foreign-pointers
   :run-program
   :save
   :save-all-buffers
   :save-lisp
   :scavenger-hook
   :scavenger-hook-p
   :search-list
   :send-character-out-of-band
   :serve-button-press
   :serve-button-release
   :serve-circulate-notify
   :serve-circulate-request
   :serve-client-message
   :serve-colormap-notify
   :serve-configure-notify
   :serve-configure-request
   :serve-create-notify
   :serve-destroy-notify
   :serve-enter-notify
   :serve-exposure
   :serve-focus-in
   :serve-focus-out
   :serve-graphics-exposure
   :serve-gravity-notify
   :serve-key-press
   :serve-key-release
   :serve-leave-notify
   :serve-map-notify
   :serve-map-request
   :serve-motion-notify
   :serve-no-exposure
   :serve-property-notify
   :serve-reparent-notify
   :serve-resize-request
   :serve-selection-clear
   :serve-selection-notify
   :serve-selection-request
   :serve-unmap-notify
   :serve-visibility-notify
   :set-floating-point-modes
   :set-symbol-function-carefully
   :short-float-negative-infinity
   :short-float-positive-infinity
   :short-floatp
   :single-float-negative-infinity
   :single-float-positive-infinity
   :single-floatp
   :start-block
   :stream-command
   :stream-command-args
   :stream-command-name
   :stream-command-p
   :instancep
   :symbolicate
   :translate-character
   :translate-key-event
   :translate-mouse-character
   :translate-mouse-key-event
   :truly-the
   :uncompile
   :undefined-value
   :unencapsulate
   :unix-namestring
   :weak-pointer
   :weak-pointer-p
   :weak-pointer-value
   :with-clx-event-handling
   :featurep
   :*ignore-extra-close-parentheses*
   :*herald-items*
   :search-list-defined-p
   :bytes-consed-between-gcs
   :*load-source-types*
   :*load-object-types*
   :*default-package-use-list*
   :*gc-run-time*
   :connect-to-unix-socket
   :define-hash-table-test
   :do-hash
   :*efficiency-note-limit*
   :*error-print-lines*
   :create-unix-socket
   :*inline-expansion-limit*
   :instance
   :*efficiency-note-cost-threshold*
   :*use-implementation-types*
   :*byte-compile-top-level*
   :*byte-compile-default*
   :unix-sockaddr
   :inet-sockaddr
   :hostent
   :htonl
   :ntohl
   :htons
   :ntohs
   :lookup-host-entry
   :host-entry
   :host-entry-name
   :host-entry-aliases
   :host-entry-addr-list
   :host-entry-addr
   :create-unix-socket
   :connect-to-unix-socket
   :create-inet-socket
   :connect-to-inet-socket
   :create-inet-listener
   :accept-tcp-connection
   :close-socket
   :ipproto-tcp
   :ipproto-udp
   :inaddr-any
   :add-oob-handler
   :remove-oob-handler
   :remove-all-oob-handlers
   :send-character-out-of-band))


(in-package :extensions)



(defconstant sock-stream 1)
(defconstant sock-dgram 2)
(defconstant sock-raw 3)

(defconstant af-unix 1)
(defconstant af-inet 2)

(defconstant msg-oob 1)
(defconstant msg-peek 2)
(defconstant msg-dontroute 4)

(defvar *internet-protocols*
  (list (list :stream 6 sock-stream)
	(list :data-gram 17 sock-dgram))
  "AList of socket kinds and protocol values.")

(defun internet-protocol (kind)
  (let ((entry (assoc kind *internet-protocols*)))
    (unless entry
      (error "Invalid kind (~S) for internet domain sockets." kind))
    (values (cadr entry)
	    (caddr entry))))


(defmacro maybe-byte-swap (var bytes)
  (ecase (c:backend-byte-order c:*backend*)
    (:big-endian
     var)
    (:little-endian
     (let ((ldbs nil))
       (dotimes (i bytes `(logior ,@ldbs))
	 (push `(ash (ldb (byte 8 ,(* i 8)) ,var)
		     ,(* (- bytes 1 i) 8))
	       ldbs))))))

(proclaim '(inline htonl ntohl htons ntohs))

(defun htonl (x)
  (maybe-byte-swap x 4))
(defun ntohl (x)
  (maybe-byte-swap x 4))
(defun htons (x)
  (maybe-byte-swap x 2))
(defun ntohs (x)
  (maybe-byte-swap x 2))


;;;; Host entry operations.

(defstruct host-entry
  name
  aliases
  addr-type
  addr-list)

(defun host-entry-addr (host)
  (declare (type host-entry host))
  (car (host-entry-addr-list host)))

(cffi:defcstruct unix-sockaddr
    (family :short)
    (path (:pointer :char)))

(cffi:defcstruct inet-sockaddr
    (family :short)
    (port :unsigned-short)
    (addr :unsigned-long)
    (zero (:pointer :char)))


;; (defctype my-bool (:wrapper :int :from-c bool-c-to-lisp
;; :to-c bool-lisp-to-c))
;; (defcstruct person
;; (number :int)
;; (reason :string))


(cffi:defcstruct hostent
    (name :string)
    (aliases (:pointer :string))
    (addrtype :int)
    (length :int)
    (addr-list (:pointer (:pointer (:unsigned-int)))))

(cffi:defcfun ("gethostbyname") :void (hostent :pointer)
  (name :string))

(cffi:defcfun ("gethostbyaddr") :void (hostent :pointer)
  (addr :unsigned-long)
  (len :int)
  (type :int))

(defun lookup-host-entry (host)
  (if (typep host 'host-entry)
      host
      (with-alien
	  ((hostent (* hostent) 
		    (etypecase host
		      (string
		       (gethostbyname host))
		      ((unsigned-byte 32)
		       (gethostbyaddr host 4 af-inet)))))
	(unless (zerop (sap-int (alien-sap hostent)))
	  (make-host-entry
	   :name (slot hostent 'name)
	   :aliases
	   (collect ((results))
	     (iterate repeat ((index 0))
	       (cond ((zerop (deref (cast (slot hostent 'aliases)
					  (* (unsigned 32)))
				    index))
		      (results))
		     (t
		      (results (deref (slot hostent 'aliases) index))
		      (repeat (1+ index))))))
	   :addr-type (slot hostent 'addrtype)
	   :addr-list
	   (collect ((results))
	     (iterate repeat ((index 0))
	       (cond ((zerop (deref (cast (slot hostent 'addr-list)
					  (* (unsigned 32)))
				    index))
		      (results))
		     (t
		      (results (deref (deref (slot hostent 'addr-list) index)))
		      (repeat (1+ index)))))))))))

(defun create-unix-socket (&optional (kind :stream))
  (multiple-value-bind (proto type)
		       (internet-protocol kind)
    (declare (ignore proto))
    (let ((socket (unix:unix-socket af-unix type 0)))
      (when (minusp socket)
	(error "Error creating socket: ~A" (unix:get-unix-error-msg)))
      socket)))

(defun connect-to-unix-socket (path &optional (kind :stream))
  (declare (simple-string path))
  (let ((socket (create-unix-socket kind)))
    (with-alien ((sockaddr unix-sockaddr))
      (setf (slot sockaddr 'family) af-unix)
      ;; (kernel:copy-to-system-area path
      ;; 				  (* vm:vector-data-offset vm:word-bits)
      ;; 				  (alien-sap (slot sockaddr 'path))
      ;; 				  0
      ;; 				  (* (1+ (length path)) vm:byte-bits))
      (when (minusp (unix:unix-connect socket
				       (alien-sap sockaddr)
				       (alien-size unix-sockaddr :bytes)))
	(unix:unix-close socket)
	(error "Error connecting socket to [~A]: ~A"
	       path (unix:get-unix-error-msg)))
      socket)))

(defun create-inet-socket (&optional (kind :stream))
  (multiple-value-bind (proto type)
		       (internet-protocol kind)
    (let ((socket (unix:unix-socket af-inet type proto)))
      (when (minusp socket)
	(error "Error creating socket: ~A" (unix:get-unix-error-msg)))
      socket)))

(defun connect-to-inet-socket (host port &optional (kind :stream))
  (let ((socket (create-inet-socket kind))
	(hostent (or (lookup-host-entry host)
		     (error "Unknown host: ~S." host))))
    (with-alien ((sockaddr inet-sockaddr))
      (setf (slot sockaddr 'family) af-inet)
      (setf (slot sockaddr 'port) (htons port))
      (setf (slot sockaddr 'addr) (host-entry-addr hostent))
      (when (minusp (unix:unix-connect socket
				       (alien-sap sockaddr)
				       (alien-size inet-sockaddr :bytes)))
	(unix:unix-close socket)
	(error "Error connecting socket to [~A:~A]: ~A"
	       (host-entry-name hostent)
	       port
	       (unix:get-unix-error-msg)))
      socket)))

(defun create-inet-listener (port &optional (kind :stream))
  (let ((socket (create-inet-socket kind)))
    (with-alien ((sockaddr inet-sockaddr))
      (setf (slot sockaddr 'family) af-inet)
      (setf (slot sockaddr 'port) (htons port))
      (setf (slot sockaddr 'addr) 0)
      (when (minusp (unix:unix-bind socket
				    (alien-sap sockaddr)
				    (alien-size inet-sockaddr :bytes)))
	(unix:unix-close socket)
	(error "Error binding socket to port ~a: ~a"
	       port
	       (unix:get-unix-error-msg))))
    (when (eq kind :stream)
      (when (minusp (unix:unix-listen socket 5))
	(unix:unix-close socket)
	(error "Error listening to socket: ~A" (unix:get-unix-error-msg))))
    socket))

(defun accept-tcp-connection (unconnected)
  (declare (fixnum unconnected))
  (with-alien ((sockaddr inet-sockaddr))
    (let ((connected (unix:unix-accept unconnected
				       (alien-sap sockaddr)
				       (alien-size inet-sockaddr :bytes))))
      (when (minusp connected)
	(error "Error accepting a connection: ~A" (unix:get-unix-error-msg)))
      (values connected (slot sockaddr 'addr)))))

(defun close-socket (socket)
  (multiple-value-bind (ok err)
		       (unix:unix-close socket)
    (unless ok
      (error "Error closing socket: ~A" (unix:get-unix-error-msg err))))
  (undefined-value))



;;;; Out of Band Data.

;;; Two level AList. First levels key is the file descriptor, second levels
;;; key is the character. The datum is the handler to call.

(defvar *oob-handlers* nil)

;;; SIGURG-HANDLER -- internal
;;;
;;;   Routine that gets called whenever out-of-band data shows up. Checks each
;;; file descriptor for any oob data. If there is any, look for a handler for
;;; that character. If any are found, funcall them.

(defun sigurg-handler (signo code scp)
  (declare (ignore signo code scp))
  (let ((buffer (make-string 1))
	(handled nil))
    (declare (simple-string buffer))
    (dolist (handlers *oob-handlers*)
      (declare (list handlers))
      (cond ((minusp (unix:unix-recv (car handlers) buffer 1 msg-oob))
	     (cerror "Ignore it"
		     "Error recving oob data on ~A: ~A"
		     (car handlers)
		     (unix:get-unix-error-msg)))
	    (t
	     (setf handled t)
	     (let ((char (schar buffer 0))
		   (handled nil))
	       (declare (base-char char))
	       (dolist (handler (cdr handlers))
		 (declare (list handler))
		 (when (eql (car handler) char)
		   (funcall (cdr handler))
		   (setf handled t)))
	       (unless handled
		 (cerror "Ignore it"
			 "No oob handler defined for ~S on ~A"
			 char
			 (car handlers)))))))
    (unless handled
      (cerror "Ignore it"
	      "Got a SIGURG, but couldn't find any out-of-band data.")))
  (undefined-value))

;;; ADD-OOB-HANDLER -- public
;;;
;;;   First, check to see if we already have any handlers for this file
;;; descriptor. If so, just add this handler to them. If not, add this
;;; file descriptor to *oob-handlers*, make sure our interupt handler is
;;; installed, and that the given file descriptor is "owned" by us (so sigurg
;;; will be delivered.)

(defun add-oob-handler (fd char handler)
  "Arange to funcall HANDLER when CHAR shows up out-of-band on FD."
  (declare (integer fd)
	   (base-char char))
  (let ((handlers (assoc fd *oob-handlers*)))
    (declare (list handlers))
    (cond (handlers
	   (push (cons char handler)
		 (cdr handlers)))
	  (t
	   (push (list fd
		       (cons char
			     handler))
		 *oob-handlers*)
	   ;; (system:enable-interrupt unix:sigurg #'sigurg-handler)
	   ;; #-hpux
	   ;; (unix:unix-fcntl fd unix:f-setown (unix:unix-getpid))
	   ;; #+hpux
	   ;; (unix:siocspgrp fd (unix:unix-getpid))
	   )))
  (values))

;;; REMOVE-OOB-HANDLER -- public
;;;
;;;   Delete any handlers for the given char from the list of handlers for the
;;; given file descriptor. If there are no more, nuke the entry for the file
;;; descriptor.

(defun remove-oob-handler (fd char)
  "Remove any handlers for CHAR on FD."
  (declare (integer fd)
	   (base-char char))
  (let ((handlers (assoc fd *oob-handlers*)))
    (declare (list handlers))
    (when handlers
      (let ((remaining (delete char handlers
			       :test #'eql
			       :key #'car)))
	(declare (list remaining))
	(if remaining
	  (setf (cdr handlers) remaining)
	  (setf *oob-handlers*
		(delete fd *oob-handlers*
			:test #'eql
			:key #'car))))))
  (values))

;;; REMOVE-ALL-OOB-HANDLERS -- public
;;;
;;;   Delete the entry for the given file descriptor.

(defun remove-all-oob-handlers (fd)
  "Remove all handlers for FD."
  (declare (integer fd))
  (setf *oob-handlers*
	(delete fd *oob-handlers*
		:test #'eql
		:key #'car))
  (values))

;;; SEND-CHARACTER-OUT-OF-BAND -- public
;;;
;;;   Sends CHAR across FD out of band.

(defun send-character-out-of-band (fd char)
  (declare (integer fd)
	   (base-char char))
  (let ((buffer (make-string 1 :initial-element char)))
    (declare (simple-string buffer))
    (when (minusp (unix:unix-send fd buffer 1 msg-oob))
      (error "Error sending ~S OOB to across ~A: ~A"
	     char
	     fd
	     (unix:get-unix-error-msg)))))
