#|

Ejercicios 1

César Armando Valladares Martínez

05-sep-2019
|#

; Ejercicio 1 Promedios

(define (promedio a b c)
    (/ (+ a b c) 3)
)

(define (calcular_promedio a b c)
    (if (> (promedio a b c) 70.0)
        (display "aprobado")
        (display "rerobado")
    )
)

; Ejercicio 2 Año bisiesto

(define (bisiesto year)

    (if (equal? (remainder year 4) 0.0) 
        (if (equal? (remainder year 400) 0.0)
            (display "bisiesto")
            (if (equal? (remainder year 100) 0.0)
                (display "No bisiesto")
                (display "bisiesto")
            )
        )
        (display "No bisiesto")
    )
)