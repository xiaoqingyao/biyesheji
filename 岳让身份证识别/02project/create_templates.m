%CREATE TEMPLATES
%Letter
X=imread('letters_numbers\X.bmp');  Y=imread('letters_numbers\Y.bmp');
xing=imread('letters_numbers\xing.bmp');ming=imread('letters_numbers\ming.bmp');
xing1=imread('letters_numbers\xing1.bmp');  bie=imread('letters_numbers\bie.bmp');
min=imread('letters_numbers\min.bmp');zu=imread('letters_numbers\zu.bmp');
chu=imread('letters_numbers\chu.bmp'); sheng=imread('letters_numbers\sheng.bmp');
nian=imread('letters_numbers\nian.bmp');yue=imread('letters_numbers\yue.bmp');
ri=imread('letters_numbers\ri.bmp'); zhu=imread('letters_numbers\zhu.bmp');
zhi=imread('letters_numbers\zhi.bmp');  gong=imread('letters_numbers\gong.bmp');
shen=imread('letters_numbers\shen.bmp');fen=imread('letters_numbers\fen.bmp');
zheng=imread('letters_numbers\zheng.bmp'); hao=imread('letters_numbers\hao.bmp');
ma=imread('letters_numbers\ma.bmp');nan=imread('letters_numbers\nan.bmp');
nv=imread('letters_numbers\nv.bmp'); han=imread('letters_numbers\han.bmp');
san=imread('letters_numbers\san.bmp');


%Number
one=imread('letters_numbers\1.bmp');  two=imread('letters_numbers\2.bmp');
three=imread('letters_numbers\3.bmp');four=imread('letters_numbers\4.bmp');
five=imread('letters_numbers\5.bmp'); six=imread('letters_numbers\6.bmp');
seven=imread('letters_numbers\7.bmp');eight=imread('letters_numbers\8.bmp');
nine=imread('letters_numbers\9.bmp'); zero=imread('letters_numbers\0.bmp');
%*-*-*-*-*-*-*-*-*-*-*-
    letter=[X Y xing ming xing1 bie min...  %每行7个
        zu chu sheng nian yue ri zhu...
        zhi gong shen fen zheng hao ma...
        nan nv han san];
number=[one two three four five...
    six seven eight nine zero];

character=[number letter];
templates=mat2cell(character,36,[23 23 23 23 23 23 23 ...%每行7个
    23 23 23 23 23 23 23....
    23 23 23 23 23 23 23....
    23 23 23 23 23 23 23....
    23 23 23 23 23 23 23
    ]);
save ('templates','templates')
clear all
