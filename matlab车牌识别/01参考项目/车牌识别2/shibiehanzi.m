function [ out ] = shibiehanzi(picture)
    result = zeros(1, 5);    
    for i =35:39
        filename = strcat('F:\matlab\shibie\zifu\', int2str(i), '.jpg');
        shuzi = imread(filename);
        level = graythresh(shuzi);          %ostu�Զ��ָ���ֵ��
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
        result(1, i-34) = Num;
    end
    num = find(result == max(result));
    switch num
        case 1
            out = '��';
        case 2
            out = '��';
        case 3
            out = '��';    
        case 4
            out = '��';    
        case 5
            out = '��';    
    end
end



