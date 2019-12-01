#lang racket

(require 2htdp/image)
(require picturing-programs)

(define (main) 
    (define image (bitmap "dragon.jpg"))
    ; (save-image image "new.jpg" ) // new image

    ; (for ([i (image-width(bitmap "dragon.jpg"))]) 
    (for ([i 3]) 
        ; (for ([j (image-height(bitmap "dragon.jpg"))])
        (for ([j 3])

            (define pix (get-pixel-color (+ i 50) (+ j 50) image))
            (printf "~a\n" pix)
        )
    )
)
