identification division.
program-id. hello.

data division.
working-storage section.
01 name     pic x(12) value "Grace Hopper".
01 newline  pic x(1)  value x'0a'. 

procedure division.
display "Hello, " name "! " newline "Thanks for inventing COBOL.".
stop run.
