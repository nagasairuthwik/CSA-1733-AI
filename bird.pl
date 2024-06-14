can_fly(hawk).
can_fly(eagle).
can_fly(albatross).
can_fly(sparrow).
can_fly(pigeon).

can_fly_message(Bird) :-
    can_fly(Bird),
    write(Bird), write(' can fly.').

can_fly_message(Bird) :-
    can_fly(Bird),
    write(Bird), write(' cannot fly.').