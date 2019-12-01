#|

Temperature converter

César Armando Valladares Martínez

02-sep-2019
|#

; C to F 

(define (C->F number)
    (+ 32(* number 9/5))
)

(define (F->C number)
    (* 5/9 (- number 32))
)
