identification division.
program-id. feet-to-meters.

data division.
working-storage section.
01 feet         pic 9999v99.
01 display_feet pic zzz9.99.
01 meters       pic zzz9.99.
01 conversion   pic 9v9999 value 0.3048.

procedure division.
display "Please enter feet: " with no advancing
accept feet
move feet to display_feet
multiply feet by conversion giving meters
display display_feet " feet equals " meters " meters"
stop run.
