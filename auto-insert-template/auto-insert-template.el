;;
;; C/C++ Header Message
;;
(define-skeleton c-cpp-header-skeleton
  "Header"
  nil
  "/**\n * File:   "
  (file-name-nondirectory (buffer-file-name)) \n
  "* Author: " (progn user-full-name) | (getenv "USER") \n
  "*" \n
  "* Created on " (format-time-string "%B %e, %Y, %l:%M %p") \n
  "*/" > \n
  "\n" \n
  )

;;
;; C skeleton
;; *.c
;;
(define-skeleton c-skeleton
  "C-Skeleton"
  nil
  "#include \""
  (file-name-sans-extension
   (file-name-nondirectory (buffer-file-name)))
  ".h\"" \n \n
  "int main() {" \n
  "" > \n
  > _ \n
  "}" > \n
  )

;;
;; C Header skeleton
;; *.h
;;
(define-skeleton h-header-skeleton
  "H-Skeleton"
  nil
  "#ifndef __" (upcase (file-name-base (buffer-file-name))) "_H" \n
  "#define __" (upcase (file-name-base (buffer-file-name))) "_H" \n \n
  "#ifdef __cplusplus" \n
  "extern \"C\" {" \n
  "#endif" > \n \n
   > _ \n \n
  "#ifdef __cplusplus" > \n
  "}" > \n
  "#endif" \n \n
  "#endif /* __" (upcase (file-name-base (buffer-file-name))) "_H */"
  )

;; C/C++ Template
(defun c-template-insert ()
  (c-cpp-header-skeleton)
  (c-skeleton)
  )

;; C/C++ Header Template
(defun h-template-insert ()
  (c-cpp-header-skeleton)
  (h-header-skeleton)
  )

;; Autoinsert
(define-auto-insert "\\.\\([Cc]\\|cc\\|cpp\\)\\'" 'c-template-insert)
(define-auto-insert "\\.\\([Hh]\\|hh\\|hpp\\)\\'" 'h-template-insert)
