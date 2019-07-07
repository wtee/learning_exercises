% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

same_row_or_column((A, B), (X, Y)) :- (A = X); (B = Y).
is_diagonal((A, B), (X, Y)) :- A + B =:= X + Y; A + X =:= B + Y.

create((X, Y)) :- X = Y, X @=< 8, X @>= 1, Y @=< 8, Y @>= 1.

attack((A, B), (X, Y)) :- same_row_or_column((A, B), (X, Y));
                          is_diagonal((A, B), (X, Y)).
