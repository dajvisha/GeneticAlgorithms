function valid = validate(inputarray)
platformvec = []; %Vector for storing drill locations that are covered by chosen platforms.
plat_perf = 0; %Control variable for 
chosen = [];
platforms = 0;

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

    for i = 1:18
        if inputarray(i) == 1
            chosen = [chosen, i];
        end
    end

    for i = 1:length(chosen)
        switch chosen(i)
            case 1
                platformvec = [platformvec I];
            case 2
                platformvec = [platformvec II];
            case 3
                platformvec = [platformvec III];
            case 4
                platformvec = [platformvec IV];
            case 5
                platformvec = [platformvec V];
            case 6
                platformvec = [platformvec VI];
            case 7
                platformvec = [platformvec VII];
            case 8
                platformvec = [platformvec VIII];
            case 9
                platformvec = [platformvec IX];
            case 10
                platformvec = [platformvec X];
            case 11
                platformvec = [platformvec XI];
            case 12
                platformvec = [platformvec XII];
            case 13
                platformvec = [platformvec XIII];
            case 14
                platformvec = [platformvec XIV];
            case 15
                platformvec = [platformvec XV];
            case 16
                platformvec = [platformvec XVI];
            case 17
                platformvec = [platformvec XVII];
            case 18
                platformvec = [platformvec XVIII];
        end
    end
    
    for i = 1:20
        if ismember(i, platformvec)
            platforms = platforms + 1;
        end
    end
    
    if platforms == 20 
        %disp('Array is valid');
        valid = 1;
    else 
        %disp('Array is not valid');
        valid = 0;
    end
end