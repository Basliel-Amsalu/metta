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
    (if (== $list Nil) False
        (if (== $value (head $list))
            True
            (is-member (tail $list) $value)
        ))
)

! (is-member 2 (Cons 1 (Cons 2 (Cons 3 Nil)))) ;->True
! (is-member 4 (Cons 1 (Cons 2 (Cons 3 Nil)))) ;->False
