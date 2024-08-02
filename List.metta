(: List type)
(: Nil List)
(: Cons (-> Number List List))

! (get-type (Cons 1 Nil)) ; List
! (Cons 1 (Cons 2 (Cons 3 Nil))) ; [1,2,3]

(= (head Nil) Nil)
(= (head (Cons $x $xs)) $x)

(= (tail Nil) Nil)
(= (tail (Cons $x $xs)) $xs)

========================================== 
 ;length of the list
(= (length $list)
    (if (== $list Nil)
        0
        (+ 1 (length (tail $list)))
    )
)

! (length (Cons 1 (Cons 2 (Cons 3 Nil)))) ;-> 3

=========================================== 
 ;is-member
(= (is-member $list $value)
    (if (== $list Nil)
        False
        (if (== $value (head $list))
            True
            (is-member (tail $list) $value)
        ))
)

! (is-member 2 (Cons 1 (Cons 2 (Cons 3 Nil)))) ;->True
! (is-member 4 (Cons 1 (Cons 2 (Cons 3 Nil)))) ;->False

============================================ 
 ;append
(= (append $list $element)
    (case $list
        (
            (Nil (Cons $element Nil))
            ( (Cons $x $xs) (Cons $x (append $xs $element)))
        )
)
)

! (append (Cons 1 (Cons 2 (Cons 3 Nil))) 4) ; ->(Cons 1 (Cons 2 (Cons 3(Cons 4 Nil))))

=============================================== 
 ;max-value
(= (max-value $list)
    (if (== $list Nil)
        Nil
        (max-value-helper (tail $list) (head $list))
    )
)

(= (max-value-helper $list $max-so-far)
    (if (== $list Nil)
        $max-so-far
        (if (> (head $list) $max-so-far)
            (max-value-helper (tail $list) (head $list))
            (max-value-helper (tail $list) $max-so-far)
        )
)
)

! (max-value (Cons 1 (Cons 3 (Cons 2 (Cons 4 Nil))))) ;-> 4

================================================== 
 ;min-value
(= (min-value $list)
    (if (== $list Nil)
        Nil
        (min-value-helper (tail $list) (head $list))
    )
)

(= (min-value-helper $list $min-so-far)
    (if (== $list Nil)
        $min-so-far
        (if (< (head $list) $min-so-far)
            (min-value-helper (tail $list) (head $list))
            (min-value-helper (tail $list) $min-so-far)
        )
)
)
! (min-value (Cons 1 (Cons 3 (Cons 2 (Cons 4 Nil))))) ; -> 1

====================================================== 
 ;push
====================================================== 
 ;pop
(= (pop $list)
    (case $list
        (
            (Nil Nil)
            ( (Cons $x Nil) Nil)
            ( (Cons $x $xs) (Cons $x (pop $xs)))
        )
)
)

! (pop (Cons 1 (Cons 2 (Cons 3 Nil)))) ;->(Cons 1 (Cons 2 Nil))

====================================================== 
 ;remove-element
(= (remove-element $list $element)
    (if (== $list Nil)
        Nil
        (if (== (head $list) $element)
            (tail $list)
            (Cons (head $list) (remove-element (tail $list) $element))
        )
)
)

! (remove-element (Cons 1 (Cons 2 (Cons 3 Nil))) 2) ;->(Cons 1 (Cons 3 Nil))
====================================================== 
