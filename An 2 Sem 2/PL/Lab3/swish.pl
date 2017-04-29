/*connected(1,2).
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

path_to(X,Y) :- connected(X,Y) .
path_to(X,Y) :- connected(X,Z) , path_to(Z,Y) .*/

/*byCar(auckland,hamilton).
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

travel_by(X,Y) :- byCar(X,Y).
travel_by(X,Y) :- byTrain(X,Y).
travel_by(X,Y) :- byPlane(X,Y).

travel(X,Y) :- travel_by(X,Y).
travel(X,Y) :- travel_by(X,Z) , travel(Z,Y).

travel(X,Y,go(X,Y)) :- travel_by(X,Y).
travel(X,Y,go(X,Z,G)) :- travel_by(X,Z) , travel(Z,Y,G).

travelx(X,Y,Z) :- */


word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(A,B,C,D,E,F) :- word(A,_,A2,_,A4,_,A6,_),
    					word(B,_,B2,_,B4,_,B6,_),
    					word(C,_,C2,_,C4,_,C6,_),
    					word(D,_,A2,_,B2,_,C2,_),
    					word(E,_,A4,_,B4,_,C4,_),
    					word(F,_,A6,_,B6,_,C6,_).
    					
























