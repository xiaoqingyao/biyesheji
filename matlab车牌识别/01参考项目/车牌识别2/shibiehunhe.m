function [ out ] = shibiehunhe(picture)
    result = zeros(1, 34);    
    for i =1:34
        filename = strcat('F:\matlab\shibie\zifu\', int2str(i), '.jpg');
        shuzi = imread(filename);
        level = graythresh(shuzi);          %ostu自动分割阈值法
        shuzi = imbinarize(shuzi, level);
        shuzi = imfilter(shuzi, fspecial('average', 3));
        Num =0;
        for j =1:48
            for k = 1:24
                if ( picture(j, k) == shuzi(j, k))
                    Num = Num+1;
                end
            end
        end
        result(1, i) = Num;
    end
    num = find(result == max(result));
    switch num
        case 1
            out = '0';
        case 2
            out = '1';
        case 3
            out = '2';    
        case 4
            out = '3';    
        case 5
            out = '4';    
        case 6
            out = '5';
        case 7
            out = '6';
        case 8
            out = '7';    
        case 9
            out = '8';    
        case 10
            out = '9';    
        case 11
            out = 'A';
        case 12
            out = 'B';
        case 13
            out = 'C';    
        case 14
            out = 'D';    
        case 15
            out = 'E';    
        case 16
            out = 'F';
        case 17
            out = 'G';
        case 18
            out = 'H';    
        case 19
            out = 'J';    
        case 20
            out = 'K';    
        case 21
            out = 'L';
        case 22
            out = 'M';
        case 23
            out = 'N';    
        case 24
            out = 'P';    
        case 25
            out = 'Q';    
        case 26
            out = 'R';
        case 27
            out = 'S';
        case 28
            out = 'T';    
        case 29
            out = 'U';    
        case 30
            out = 'V';    
        case 31
            out = 'W';
        case 32
            out = 'X';
        case 33
            out = 'Y';    
        case 34
            out = 'Z';         
    end
end

