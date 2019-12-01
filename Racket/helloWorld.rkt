#|
First program in rocket
    Valid extensions: .rkt or .scm
César Armando Valladares Martínez

02-sep-2019
|#

; Create a greeeting function
(define (greeting name)
    (display (string-append "hello " name "!"))
)