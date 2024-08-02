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
 ;remove-duplicate
(= (remove-duplicates $list)
    (if (== $list Nil)
        Nil
        (Cons (head $list) (remove-duplicates (remove-duplicate-helper (tail $list) (head $list))))
    )
)
(= (remove-duplicate-helper $list $element)
    (if (== $list Nil)
        Nil
        (if (== (head $list) $element)
            (remove-element (tail $list) $element)
            (Cons (head $list) (remove-element (tail $list) $element))
        )
)
)

! (remove-duplicates (Cons 1 (Cons 2 (Cons 2 (Cons 3 (Cons 3 Nil)))))) ; -> (Cons 1 (Cons 2 (Cons 3 Nil)))

======================================================== 
 ;map
(= (map $func $list)
    (if (== $list Nil)
        Nil
        (Cons ($func (head $list)) (map $func (tail $list)))
    )
)

(= (square $x) (* $x $x))

! (map square (Cons 1 (Cons 2 (Cons 3 Nil)))) ; => (Cons 1 (Cons 4 (Cons 9 Nil)))
======================================================== 
 ;filter
======================================================== 
 ;foldl
======================================================== 
 ;foldr
======================================================== 
 ;reverse
(= (reverse $list)
    (reverse-helper $list Nil)
)

(= (reverse-helper $list $acc)
    (if (== $list Nil)
        $acc
        (reverse-helper (tail $list) (Cons (head $list) $acc))
    )
)

! (reverse (Cons 1 (Cons 2 (Cons 3 Nil)))) ;-> (Cons 3 (Cons 2 (Cons 1 Nil)))

========================================================== 
 ;sort
(= (sort $list)
    (if (== $list Nil)
        Nil
        (insert (head $list) (sort (tail $list)))
    )
)

(= (insert $x $sorted-list)
    (if (== $sorted-list Nil)
        (Cons $x Nil)
        (if (< $x (head $sorted-list))
            (Cons $x $sorted-list)
            (Cons (head $sorted-list) (insert $x (tail $sorted-list)))
        )
)
)

! (sort (Cons 4 (Cons 1 (Cons 0 Nil)))) ;->(Cons 0 (Cons 1 (Cons 4 Nil)))