% Based on the Nani Search exercises in Adventure in Prolog by Dennis
% Merritt (1990).

% Rooms in the house
room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

% Where various objects are located
%% Office
location(desk, office).
location(computer, office).
location(flashlight, desk).

%% Kitchen
location(apple, kitchen).
location(broccoli, kitchen).
location(crackers, kitchen).

%% Cellar
location('washing machine', cellar).
location(nani, 'washing machine').

% Doors between different rooms
door(hall, office).
door(office, hall).

door(hall, 'dining room').
door('dining room', hall).

door('dining room', kitchen)
door(kitchen, 'dining room').

door(kitchen, cellar).
door(cellar, kitchen).

door(kitchen, office).
door(office, kitchen).

% Food
edible(apple).
edible(crackers).
edible(broccoli).

tastes_yucky(broccoli).

% Equipment status
turned_off(computer).
turned_off(flashlight).

% Player location
here(kitchen).