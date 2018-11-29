function c = cost(vec)

a = 1;
d = 0.5;
chosen = []; %Vector for storing chosen platforms after analyzing input vector. 
platforms = 0; %Control variable that assures that all locations are being covered by solution. 
incost = []; %Vector for sotring values that will be used to calculate hs. 
hvec = [];
ck = [1 10; 2 19; 3 27; 4 34; 5 40; 6 45; 7 49; 8 52; 9 54; 20 90];
totalcost = 0;

%Assign Coordinates for Perforation
coordinates = [1 1; 2 1; 3 1; 2 2; 3 2; 3 3; 4 3; 4 4; 6 4; 4 5; 6 6; 9 5; 4 7; 8 7; 5 8; 6 8; 10 8; 6 9; 8 9; 10 9];
one = [1 1];
two = [2 1];
three = [3 1];
four = [2 2];
five = [3 2];
six = [3 3];
seven = [4 3];
eight = [4 4];
nine = [6 4];
ten = [4 5];
eleven = [6 6];
twelve = [9 5];
thirteen = [4 7];
fourteen = [8 7];
fifteen = [5 8];
sixteen = [6 8];
seventeen = [10 8];
eighteen = [6 9];
nineteen = [8 9];
twenty = [10 9];

%Assign perforations to Platforms
%platforms = [ 1 2 3 ; 4 5 6; 7 8 9 10 11; 10 11; 16 17; 12 13; 14 15; 14 15 18; 
%    12 13 14 15; 18 19 20; 16 17 18 19 20; 10 11 16 17; 1 2 3 4 5 6 7 8 9; 
%    1 2 3 4 5; 19 20; 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

I = [1 2 3];
II = [4 5 6];
III = [7 8 9];
IV = [6 8 9];
V = [7 8 9 10 11];
VI = [10 11];
VII = [16 17];
VIII = [12 13];
IX = [14 15];
X = [14 15 18];
XI = [12 13 14 15];
XII = [18 19 20];
XIII = [16 17 18 19 20];
XIV = [10 11 16 17];
XV = [1 2 3 4 5 6 7 8 9];
XVI = [1 2 3 4 5];
XVII = [19 20];
XVIII = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

%Assign centroid values
cenI = (one + two + three) / 3;
cenII = (four + five + six) / 3;
cenIII = (seven + eight + nine) / 3;
cenIV = (six + eight + nine) / 3;
cenV = (seven + eight + nine + ten + eleven) / length(V);
cenVI = (ten + eleven) / 2;
cenVII = (sixteen + seventeen) / 2;
cenVIII = (twelve + thirteen) / 2;
cenIX = (fourteen + fifteen) / 2;
cenX = (fourteen + fifteen +eighteen) / 3;
cenXI = (twelve + thirteen + fourteen + fifteen) / length(XI);
cenXII = (eighteen + nineteen + twenty);
cenXIII = (sixteen + seventeen + eighteen + nineteen + twenty) / 5;
cenXIV = (ten + eleven + sixteen + seventeen) / 4;
cenXV = (one + two + three + four + five + six + seven + eight + nine) / 9;
cenXVI = (one + two + three + four + five) / 5;
cenXVII = (nineteen + twenty) / 2;
cenXVIII = (one + two + three + four + five + six + seven + eight + nine + ten + eleven + twelve + thirteen + fourteen + fifteen + sixteen + seventeen + eighteen + nineteen + twenty);
centroids = [cenI;cenII;cenIII;cenIV;cenV;cenVI;cenVII;cenVIII;cenIX;cenX;cenXI;cenXII;cenXIII;cenXIV;cenXV;cenXVI;cenXVII;cenXVIII];

for i = 1:18
    if vec(i) == 1
        chosen = [chosen, i];
    end
end

for i = 1:length(chosen)
    switch chosen(i)
        case 1
             hvec = [];
            for i = 1:length(I)
                cpp = ck(length(I),2);
                hvec = [hvec (pozo_cent(coordinates(I(i),:),cenI))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 2
            hvec = [];
            for i = 1:length(II)
                cpp = ck(length(II),2);
                hvec = [hvec (pozo_cent(coordinates(II(i),:),cenII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 3
             hvec = [];
            for i = 1:length(III)
                cpp = ck(length(III),2);
                hvec = [hvec (pozo_cent(coordinates(III(i),:),cenIII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 4
            hvec = [];
            for i = 1:length(IV)
                cpp = ck(length(IV),2);
                hvec = [hvec (pozo_cent(coordinates(IV(i),:),cenIV))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 5
            hvec = [];
            for i = 1:length(V)
                cpp = ck(length(V),2);
                hvec = [hvec (pozo_cent(coordinates(V(i),:),cenV))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 6
            hvec = [];
            for i = 1:length(VI)
                cpp = ck(length(VI),2);
                hvec = [hvec (pozo_cent(coordinates(VI(i),:),cenVI))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 7
            hvec = [];
            for i = 1:length(VII)
                cpp = ck(length(VII),2);
                hvec = [hvec (pozo_cent(coordinates(VII(i),:),cenVII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 8
            hvec = [];
            for i = 1:length(VIII)
                cpp = ck(length(VIII),2);
                hvec = [hvec (pozo_cent(coordinates(VIII(i),:),cenVIII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 9
            hvec = [];
            for i = 1:length(IX)
                cpp = ck(length(IX),2);
                hvec = [hvec (pozo_cent(coordinates(IX(i),:),cenIX))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 10
            hvec = [];
            for i = 1:length(X)
                cpp = ck(length(X),2);
                hvec = [hvec (pozo_cent(coordinates(X(i),:),cenX))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 11
            hvec = [];
            for i = 1:length(XI)
                cpp = ck(length(XI),2);
                hvec = [hvec (pozo_cent(coordinates(XI(i),:),cenXI))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
            
        case 12
            hvec = [];
            for i = 1:length(XII)
                cpp = ck(length(XII),2);
                hvec = [hvec (pozo_cent(coordinates(XII(i),:),cenXII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 13
            hvec = [];
            for i = 1:length(XIII)
                cpp = ck(length(XIII),2);
                hvec = [hvec (pozo_cent(coordinates(XIII(i),:),cenXIII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 14
            hvec = [];
            for i = 1:length(XIV)
                cpp = ck(length(XIV),2);
                hvec = [hvec (pozo_cent(coordinates(XIV(i),:),cenXIV))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 15
            hvec = [];
            for i = 1:length(XV)
                cpp = ck(length(XV),2);
                hvec = [hvec (pozo_cent(coordinates(XV(i),:),cenXV))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 16
            hvec = [];
            for i = 1:length(XVI)
                cpp = ck(length(XVI),2);
                hvec = [hvec (pozo_cent(coordinates(XVI(i),:),cenXVI))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 17
            hvec = [];
            for i = 1:length(XVII)
                cpp = ck(length(XVII),2);
                hvec = [hvec (pozo_cent(coordinates(XVII(i),:),cenXVII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
        case 18
            hvec = [];
            for i = 1:length(XVIII)
                cpp = ck(10,2);
                hvec = [hvec (pozo_cent(coordinates(XVIII(i),:),cenXVII))];
            end
            for i = 1:length(hvec)
                totalcost = totalcost + a * (hvec(i)+d)^2 ;
            end
            totalcost = totalcost + cpp;
    end
end

c = totalcost;

end
