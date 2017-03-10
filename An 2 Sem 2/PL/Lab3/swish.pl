parent_of(rickardStark,eddardStark).

parent_of(rickardStark,lyannaStark).

parent_of(lyarraStark,eddardStark).

parent_of(lyarraStark,lyannaStark).

parent_of(aerysTargaryen,rhaegarTargaryen).

parent_of(rhaellaTargaryen,rhaegarTargaryen).

parent_of(rhaegarTargaryen,jonSnow).

parent_of(lyannaStark,jonSnow).

ancestor_of(X,Y) :- parent_of(X,Y).

ancestor_of(X,Y) :- parent_of(X,Z), ancestor_of(Z,Y).


% Maze

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path_to(X,Y) :- connected(X,Y).
path_to(X,Y) :- connected(X,Z) , path_to(Z,Y).


% Travel

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
 
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
 
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

goBy(X,Y) :- byCar(X,Y).
goBy(X,Y) :- byTrain(X,Y).
goBy(X,Y) :- byPlane(X,Y).

travel(X,Y) :- goBy(X,Y).
travel(X,Y) :- goBy(X,Z) , travel(Z,Y).

travel(X,Y,go(X,Y)) :- goBy(X,Y).
travel(X,Y,go(X,Z,G)) :- goBy(X,Z) , travel(Z,Y,G).

travelx(X,Y,Z) :-  








































