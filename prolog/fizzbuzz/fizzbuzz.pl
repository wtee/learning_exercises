divisible_by_3(N) :- 0 is mod(N, 3).

divisible_by_5(N) :- 0 is mod(N, 5).

not_divisible_by_3_or_5(N) :-
  \+ (divisible_by_3(N); divisible_by_5(N)).

fizzbuzz_atom(N) :-
    (not_divisible_by_3_or_5(N) -> write(N);
    (divisible_by_3(N) -> write('fizz'); true),
      (divisible_by_5(N) -> write('buzz'); true)),
    nl.

fizzbuzz_list([]).
fizzbuzz_list([H|T]) :- fizzbuzz_atom(H), fizzbuzz_list(T).

fizzbuzz :- findall(N, between(1, 100, N), L), fizzbuzz_list(L).