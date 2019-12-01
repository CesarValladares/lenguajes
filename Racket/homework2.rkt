#|

Homework 2

César Armando Valladares Martínez

A01023506

|#

(define (bisiesto year) ; Function that returns the maximum days of February depending on the year
    (if (equal? (remainder year 4) 0) 
        (if (equal? (remainder year 400) 0)
            29
            (if (equal? (remainder year 100) 0)
                28
                29
            )
        )
        28
    )
)

(define (max_day month year) ; Function that returns the maximum days depending on the month 

    ; Months that have 31 days
    (if (or (equal? month 1) (equal? month 3) (equal? month 5) (equal? month 7) (equal? month 8) (equal? month 10) (equal? month 12))
        31
        ; Months that have 32 days
        (if (or (equal? month 4) (equal? month 6) (equal? month 9) (equal? month 11))
            30
            ; February
            (bisiesto year)
        )
    )
)

(define (next_day date)
    (let* ([day (car date)][month (cadr date)][year (caddr date)][max (max_day month year)]) ; Setting "day" "month" "year" from the list given 
        (if (>(+ day 1) max)        ; If last day of the month
            (if (> (+ month 1) 12)   ; If last month of the year
                (list 1 1 (+ year 1)) ; New year
                (list 1 (+ month 1) year) ; New Month
            )
            (list (+ day 1) month year) ; New day
        )
    )
)
