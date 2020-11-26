function [ out ] = shibiezimu(picture)
    result = zeros(1, 24);    
    for i =11:34
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
        result(1, i-10) = Num;
    end
    num = find(result == max(result));
    switch num
        case 1
            out = 'A';
        case 2
            out = 'B';
        case 3
            out = 'C';    
        case 4
            out = 'D';    
        case 5
            out = 'E';    
        case 6
            out = 'F';
        case 7
            out = 'G';
        case 8
            out = 'H';    
        case 9
            out = 'J';    
        case 10
            out = 'K';    
        case 11
            out = 'L';
        case 12
            out = 'M';
        case 13
            out = 'N';    
        case 14
            out = 'P';    
        case 15
            out = 'Q';    
        case 16
            out = 'R';
        case 17
            out = 'S';
        case 18
            out = 'T';    
        case 19
            out = 'U';    
        case 20
            out = 'V';    
        case 21
            out = 'W';
        case 22
            out = 'X';
        case 23
            out = 'Y';    
        case 24
            out = 'Z';         
    end
end



