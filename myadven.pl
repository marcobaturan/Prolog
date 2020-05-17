%% My Adventure in Prolog
%% Based in tutorial of Anzi Prolog but follow
%% the documentation of Swi-Prolog for proper working.
%% Read the link below:
% https://www.amzi.com/AdventureInProlog/
% Facts database,
% Read the link below:
% https://www.swi-prolog.org/pldoc/man?predicate=retract/1
:- dynamic here/1.

% Rooms.
room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

% Locations between rooms.Old definitions not list.
is_in(desk, room(office)).
is_in(apple, room(kitchen)).
is_in(flashlight, desk).
is_in('washing machine', room(cellar)).
is_in(nani, 'washing machine').
is_in(broccoli, room(kitchen)).
is_in(crackers, room(kitchen)).
is_in(computer, room(office)).
is_in(envelope, desk).
is_in(stamp, envelope).
is_in(key, envelope).

% Location elements in a list related to places.
loc_list([apple, broccoli, crackers], kitchen).
loc_list([desk, computer], office).
loc_list([flashlight, envelope], desk).
loc_list([stamp, key], envelope).
loc_list(['washing machine'], cellar).
loc_list([nani], 'washing machine').
loc_list([], hall).

% Doors between rooms.
door(office, hall).
door(kitchen, office).
door(hall, 'dining room').
door(kitchen, cellar).
door('dining room', kitchen).

% Facts about properties of things.
edible(apple).
edible(crackers).
tastes_yucky(broccoli).

% Initial status of game.
turned_off(flashlight).
here(kitchen).

% Semantics for objects.
object(candle, red, small, 1).
object(apple, red, small, 1).
object(apple, green, small, 1).
object(table, blue, big, 50).

% Rules base.
% FInd food.
where_food(X,Y):-location(X,Y),edible(X).
where_food(X,Y):-location(X,Y),tastes_yucky(X).

% Conect doors. 
% With this trick we can declare once 
% the relations between rooms and reverse the relation.
connect(X,Y):-door(X,Y).
connect(X,Y):-door(Y,X).

% This is nanny search engine.
list_things(Place):-
	location(X, Place),
	tab(2),
	write(X),
	nl,
	fail.

% Trick for not show 'false' and not show message of
% singleton variable thanks to anonym variable '_' .
list_things(_).
list_connections(Place):-
	connect(Place, X),
	tab(2),
	write(X),
	nl,
	fail.
list_connections(_).

% Rule for look.
look:-
	here(Place),
	write('You are in te '), write(Place), nl,
	write('You can see: '), nl,
	list_things(Place),
	write('You can go to: '), nl,
	list_connections(Place).

% Rule for go to other places.
go_to(Place):-
	can_go(Place),
	move(Place),
	look.

% Rule for know the posibility of go to a place.
% Remember ad anonym variable to avoid singleton error.
can_go(Place):-
	here(X),
	connect(X, Place).
can_go(_):-
	write("You can't get there from here. "),nl,
	fail.

% Rule for movement across the house.
% Remember ad anonym variable to avoid singleton error.
move(Place):-
	retract(here(_)),
	asserta(here(Place)).

% Rules for take, can take, take object.
take(X):-  
	can_take(X),
	take_object(X).
can_take(Thing) :-
	here(Place),
  	location(Thing, Place).
can_take(Thing) :-
  	write('There is no '), write(Thing),
  	write(' here.'),
  	nl, fail.
take_object(X):-  
  	retract(location(X,_)),
  	asserta(have(X)),
  	write('taken'), nl.

% Rules for look if one thing is contained in other thing.
% First find ever the place in.
is_contained_in(T1,T2):-  
  	location(T1,T2).

% And then find the place in the nested place in.
is_contained_in(T1, T2):-
	location(X, T2),
	is_contained_in(T1,X).

% Rules for define the semantics of objects.
location_s(object(candle, red, small, 1), kitchen).
location_s(object(apple, red, small, 1), kitchen).
location_s(object(apple, green, small, 1), kitchen).
location_s(object(table, blue, big, 50), kitchen).

% Rule take things.
can_take_s(Thing):-
  here(Room),
  location_s(object(Thing, _, small,_), Room).
can_take_s(Thing):-
  here(Room),
  location_s(object(Thing, _, big, _), Room),
  write('The '), write(Thing), 
  write(' is too big to carry.'), nl,
  fail.
can_take_s(Thing):-
  here(Room),
  not(location_s(object(Thing, _, _, _), Room)),
  write('There is no '), write(Thing), write(' here.'), nl,
  fail.
lis2t_things_s(Place) :-  
  location_s(object(Thing, Color, Size, Weight),Place),
  write('A '),write(Size),tab(1),
  write(Color),tab(1),
  write(Thing), write(', weighing '),
  write(Weight), write(' pounds'), nl,
  fail.
list_things_s(_).
write_weight(1) :-
  write('1 pound').
write_weight(W) :-
  W > 1,
  write(W), write(' pounds').

% Rules for get location, list, members, add and put.
location(X,Y):-  
  loc_list(List, Y),
  member(X, List).
add_thing(NewThing, Container, NewList):-  
  loc_list(OldList, Container),
  append([NewThing],OldList, NewList).
put_thing(Thing,Place) :-
  retract(loc_list(List, Place)),
  asserta(loc_list([Thing|List],Place)).

% Rules for break out the elements in the pocket.
break_out([]).
break_out([Head | Tail]):-
  assertz(stuff(Head)),
  break_out(Tail).

% Control command for go to place.
goto(Place):-
	can_go(Place),
	move(Place),
	look.

% Main loop.
command_loop:- 
  write('Welcome to Nani Search'), nl,
  repeat,
  write('>nani> '),
  read(X),
  puzzle(X),
  do(X), nl,
  end_condition(X).

% Do while analogy.
do(goto(X)):-goto(X),!.
do(go(X)):-goto(X),!.
do(inventory):-inventory,!.
do(look):-look,!.
do(take(X)) :- take(X), !.
do(end).
do(_) :-
  write('Invalid command').

% End condition.
end_condition(end).
end_condition(_) :-
  have(nani),
  write('Congratulations').

% Front end for English comunication.
command(OutputList, InputList).
command([V], InList):- verb(V, InList-[]).
verb(look, [look|X]-X).
verb(look, [look,around|X]-X).
verb(list_possessions, [inventory|X]-X).
verb(end, [end|X]-X).
verb(end, [quit|X]-X).
verb(end, [good,bye|X]-X).
command([V,O], InList) :-
  verb(Object_Type, V, InList-S1),
  object(Object_Type, O, S1-[]).
verb(place, goto, [go,to|X]-X).
verb(place, goto, [go|X]-X).
verb(place, goto, [move,to|X]-X).
verb(place, goto, [X|Y]-[X|Y]):- room(X).
verb(place, goto, [dining,room|Y]-[dining,room|Y]).
verb(thing, take, [take|X]-X).
verb(thing, drop, [drop|X]-X).
verb(thing, drop, [put|X]-X).
verb(thing, turn_on, [turn,on|X]-X).
object(Type, N, S1-S3) :-
  det(S1-S2),
  noun(Type, N, S2-S3).
object(Type, N, S1-S2) :-
  noun(Type, N, S1-S2).
det([the|X]- X).
det([a|X]-X).
det([an|X]-X).
noun(place, R, [R|X]-X):- room(R).
noun(place, 'dining room', [dining,room|X]-X).
noun(thing, T, [T|X]-X):- location(T,_).
noun(thing, T, [T|X]-X):- have(T).
noun(thing, 'washing machine', [washing,machine|X]-X).
noun(thing, flashlight, [light|X], X):- have(flashlight).
noun(thing, light, [light|X], X).
command([V,O]) --> 
  verb(Object_Type, V), 
  object(Object_Type, O).

verb(place, goto) --> [go, to].
verb(thing, take) --> [take].

object(Type, N) --> det, noun(Type, N).
object(Type, N) --> noun(Type, N).

det --> [the].
det --> [a].

noun(place,X) --> [X], {room(X)}.
noun(place,'dining room') --> [dining, room].
noun(thing,X) --> [X], {location(X,_)}.
command([goto, Place]) --> noun(place, Place).
