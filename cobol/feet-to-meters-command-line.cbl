identification division.
program-id. feet-to-meters-command-line.

*> Accept a number from the command line and convert it from feet to
*> meters.

data division.
working-storage section.
01 ws-feet-num              pic 9(4)v99.
01 ws-meters-num            pic z(3)9.99.
01 ws-conversion-const      pic 9v9999 value 0.3048.

procedure division.
accept ws-feet-num from command-line
multiply ws-feet-num by ws-conversion-const giving ws-meters-num
display ws-meters-num 
stop run.
