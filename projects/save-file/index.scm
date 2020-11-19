(define txt-output-file (open-output-file "file.txt"))
(display "text to write" txt-output-file)
(close-port txt-output-file)
