
(use-modules (scheme base)
        (scheme process-context)
        (scheme write)
        (ab srfi-197g))
(newline)
 (chain ""
         (string-append "foo" _)
         (string-append "bar" _)
         (string-append "baz" _)
         (display _))

(newline)
(chain-when ""
        ((> 2 1) (string-append "foo" _))
        ((> 2 1) (string-append "bar" _))
        ((< 2 1) (string-append "baz" _))
        ((> 2 1) (display _)))
(newline)
 (nest-reverse 4 <>
                (<>)
                (3 <> 5)
                (1 2 <>)
                (quote <>)
                (display <>))

(nest  _   
        (display _)
        (+ _ 5)
       (+ _ 4)
       (+ _ 3)
        4)

(nest 
        (display _)
        (string-append "foo" _)
        (string-append "bar" _)
        (string-append "baz" _)
        "")
        
(nest-reverse ""      
        (string-append "foo" _)
        (string-append "bar" _)
        (string-append "baz" _)
        (display _))