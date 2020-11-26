function y=liantongyu(g);
a=rgb2gray(g);
s=size(a);
N=s(1);
M=s(2);
Wb=round(M/16);
Wf=round(Wb/5);
H =fspecial('average',[Wb Wb]);
u1=filter2(H,a);

for i=1:N
      for j=1:M
      if mod(Wf,2)==1
           W=(Wf-1)/2;
         if j>W&&j<M-W&&i>W&&i<N-W
             su=0;
           for k=i-W:i+W
               for l=j-W:j+W
                   su=su+double(a(k,l));
               end
           end
          mea=su/(Wf*Wf);
          sm=0;
           for k=i-W:i+W-1
               for l=j-W:j+W-1
                   sm=sm+(double(a(k,l))-mea)^2;
               end
           end
           u2(i,j)=sqrt(sm/(Wf*Wf));
         else  u2(i,j)=0;
         end
      else W=Wf/2;
          if j>W&&j<M-W+1&&i>W&&i<N-W+1
            su=0;
            for k=i-W:i+W
               for l=j-W:j+W
                   su=su+double(a(k,l));
               end
           end
          mea=su/(Wf*Wf);
          sm=0;
           for k=i-W:i+W-1
               for l=j-W:j+W-1
                   sm=sm+(double(a(k,l))-mea)^2;
               end
           end
           u2(i,j)=sqrt(sm/(Wf*Wf));
         else  u2(i,j)=0;
          end
      end
      end
end
q=round(0.8*Wf*Wf);
T1=medfilt2(u1,[Wb Wb]);
T2=ord(u2,q,Wf);
T=T1+0.3*T2;
TT=T1-0.3*T2;
for i=1:N
     for j=1:M
         if a(i,j)>T(i,j)
             nln(i,j)=1;
         else if a(i,j)<TT(i,j)
             nln(i,j)=-1;
             else nln(i,j)=0;
             end
         end
     end
end
for i=1:N
    for j=1:M
        if nln(i,j)==1
            a1(i,j)=1;
        else a1(i,j)=0;
        end
        if nln(i,j)==-1
            a2(i,j)=1;
        else a2(i,j)=0;
        end
    end
end
b1=bwlabel(a1);
b2=bwlabel(a2);
max1=max(b1(:));
max2=max(b2(:));
%%%%%第一个特征
area1=zeros(1,max1);
area2=zeros(1,max2);
for i=1:N
     for j=1:M
         if b1(i,j)>0
             area1(b1(i,j))=area1(b1(i,j))+1;
         end
         if b2(i,j)>0
             area2(b2(i,j))=area2(b2(i,j))+1;
         end
     end
 end
 
arearatio1=area1/(N*M);
arearatio2=area2/(N*M);
%%%%%%第二,三,八个特征
for k=1:max1
    [r,z]=find(b1==k);
    w1(k)=max(z)-min(z)+1;
    h1(k)=max(r)-min(r)+1;
    lengthratio1(k)=max(w1(k),h1(k))/max(N,M);
    aspectratio1(k)=max(w1(k)/h1(k),h1(k)/w1(k));
    occupyratio1(k)=area1(k)/(w1(k)*h1(k));
end
for k=1:max2
    [r,z]=find(b2==k);
    w2(k)=max(z)-min(z)+1;
    h2(k)=max(r)-min(r)+1;
    lengthratio2(k)=max(w2(k),h2(k))/max(N,M);
    aspectratio2(k)=max(w2(k)/h2(k),h2(k)/w2(k));
    occupyratio2(k)=area2(k)/(w2(k)*h2(k));
end
%%%第四,七个特征
for i=1:N
     for j=1:M
         Border1(i,j)=1;
         if i>=2&&i<=N-1&&j>=2&&j<=M-1
            if b1(i,j)>0 && b1(i-1,j)==b1(i,j)&&b1(i+1,j)==b1(i,j)&&b1(i,j-1)==b1(i,j)&&b1(i,j+1)==b1(i,j)
             Border1(i,j)=0;
            end
         else if b1(i,j)==0
                 Border1(i,j)=0;
             end
         end
     end
end
for i=1:N
     for j=1:M
         Border2(i,j)=1;
         if i>=2&&i<=N-1&&j>=2&&j<=M-1
            if b2(i,j)>0 && b2(i-1,j)==b2(i,j)&&b2(i+1,j)==b2(i,j)&&b2(i,j-1)==b2(i,j)&&b2(i,j+1)==b2(i,j)
             Border2(i,j)=0;
            end
         else if b2(i,j)==0
                 Border2(i,j)=0;
             end
         end
     end
end
can1=edge(a,'canny');
sob1=edge(a,'sobel');
edg1=or(can1,sob1);
bord1=and(logical(Border1),edg1);
border1=zeros(1,max1);
bor1=zeros(1,max1);
can2=edge(a,'canny');
sob2=edge(a,'sobel');
edg2=or(can2,sob2);
bord2=and(logical(Border2),edg2);
border2=zeros(1,max2);
bor2=zeros(1,max2);
for i=1:N
    for j=1:M
        if b1(i,j)>0&&Border1(i,j)==1
            border1(b1(i,j))=border1(b1(i,j))+1;
        end
        if b1(i,j)>0&&bord1(i,j)==1
            bor1(b1(i,j))=bor1(b1(i,j))+1;
        end
        if b2(i,j)>0&&Border2(i,j)==1
            border2(b2(i,j))=border2(b2(i,j))+1;
        end
        if b2(i,j)>0&&bord2(i,j)==1
            bor2(b2(i,j))=bor2(b2(i,j))+1;
        end
    end
end
for k=1:max1
    edgecontrast1(k)=bor1(k)/border1(k);
    compact1(k)=area1(k)/(border1(k)^2);
end
for k=1:max2
    edgecontrast2(k)=bor2(k)/border2(k);
    compact2(k)=area2(k)/(border2(k)^2);
end
%%第五,十一，十二个特征
see=[0 1 0; 1 1 1; 0 1 0];
se2=[0 0 0 1 0 0 0;0 0 1 1 1 0 0 ;0 1 1 1 1 1 0 ;1 1 1 1 1 1 1 ;0 1 1 1 1 1 0;0 0 1 1 1 0 0;0 0 0 1 0 0 0];
k=1;
while(k<=max1)
   for i=1:N
    for j=1:M
        if b1(i,j)==k
            cc1(i,j)=1;
        else cc1(i,j)=0;
        end
    end
   end
   ccfill1=imfill(cc1,'holes');
   ccdilate1=imdilate(cc1,se2);
   for i=1:N
       for j=1:M
           if b1(i,j)==0&&ccdilate1(i,j)==1
               bound1(i,j)=1;
           else bound1(i,j)=0;
           end
       end
   end
   cchole1=abs(cc1-ccfill1);
   [l1,n1]=bwlabel(cchole1,4);
   ccopen1=imopen(ccfill1,see);
   ccc1=abs(cc1-ccopen1);
   contourroughness1(k)=sum(sum(ccc1))/sum(sum(cc1));
   ccholes1(k)=n1;
   arearatio_s1(k)=sum(sum(ccdilate1))/(N*M);
   boundary_s1(k)=sum(sum(bound1))/(N*M);
   k=k+1;
end


k=1;
while(k<=max2)
   for i=1:N
    for j=1:M
        if b2(i,j)==k
            cc2(i,j)=1;
        else cc2(i,j)=0;
        end
    end
   end
   ccfill2=imfill(cc2,'holes');
   ccdilate2=imdilate(cc2,se2);
   for i=1:N
       for j=1:M
           if b2(i,j)==0&&ccdilate2(i,j)==1
               bound2(i,j)=1;
           else bound2(i,j)=0;
           end
       end
   end
   cchole2=abs(cc2-ccfill2);
   [l2,n2]=bwlabel(cchole2,4);
   ccopen2=imopen(ccfill2,see);
   ccc2=abs(cc2-ccopen2);
   contourroughness2(k)=sum(sum(ccc2))/sum(sum(cc2));
   ccholes2(k)=n2;
   arearatio_s2(k)=sum(sum(ccdilate2))/(N*M);
   boundary_s2(k)=sum(sum(bound2))/(N*M);
   k=k+1;
end

%%第九,十个特征
ccskel1=bwmorph(a1,'skel',inf);
ccskel2=bwmorph(a2,'skel',inf);
dis1=zeros(N,M);
dis2=zeros(N,M);
dissum1=zeros(1,max1);
skenum1=zeros(1,max1);
dissum2=zeros(1,max2);
skenum2=zeros(1,max2);
for i=1:N
    for j=1:M
        if ccskel1(i,j)==1
            dist=[];
            for k=0:M-j
                    if Border1(i,j+k)==1&&b1(i,j)==b1(i,j+k)
                    dist=[dist,k];
                    end
            end
            for k=0:j-1
                if Border1(i,j-k)==1&&b1(i,j)==b1(i,j-k)
                    dist=[dist,k];
                end
            end
            for k=0:N-i
                if Border1(i+k,j)==1&&b1(i,j)==b1(i+k,j)
                    dist=[dist,k];
                end
            end
            for k=0:i-1
                if Border1(i-k,j)==1&&b1(i,j)==b1(i-k,j)
                    dist=[dist,k];
                end
            end
        dis1(i,j)=min(dist);
        skenum1(b1(i,j))=skenum1(b1(i,j))+1;
        dissum1(b1(i,j))=dissum1(b1(i,j))+dis1(i,j);
        end
    end
end
for k=1:max1
    if skenum1(k)>0
    stroke_mean1(k)=dissum1(k)/skenum1(k);
    else stroke_mean1(k)=0;
    end
end
var1=zeros(1,max1);
for i=1:N
    for j=1:M
        if dis1(i,j)>0
            var1(b1(i,j))=var1(b1(i,j))+(dis1(i,j)-stroke_mean1(b1(i,j)))^2;
        end
    end
end
for k=1:max1
    if stroke_mean1(k)>0
    stroke_std1(k)=sqrt(var1(k)/skenum1(k))/stroke_mean1(k);
    else stroke_std1(k)=0;
    end
end
for i=1:N
    for j=1:M
        if ccskel2(i,j)==1
            dist=[];
            for k=0:M-j
                    if Border2(i,j+k)==1&&b2(i,j)==b2(i,j+k)
                    dist=[dist,k];
                    end
            end
            for k=0:j-1
                if Border2(i,j-k)==1&&b2(i,j)==b2(i,j-k)
                    dist=[dist,k];
                end
            end
            for k=0:N-i
                if Border2(i+k,j)==1&&b2(i,j)==b2(i+k,j)
                    dist=[dist,k];
                end
            end
            for k=0:i-1
                if Border2(i-k,j)==1&&b2(i,j)==b2(i-k,j)
                    dist=[dist,k];
                end
            end
        dis2(i,j)=min(dist);
        skenum2(b2(i,j))=skenum2(b2(i,j))+1;
        dissum2(b2(i,j))=dissum2(b2(i,j))+dis2(i,j);
        end
    end
end
for k=1:max2
    if skenum2(k)>0
    stroke_mean2(k)=dissum2(k)/skenum2(k);
    else stroke_mean2(k)=0;
    end
end
var2=zeros(1,max2);
for i=1:N
    for j=1:M
        if dis2(i,j)>0
            var2(b2(i,j))=var2(b2(i,j))+(dis2(i,j)-stroke_mean2(b2(i,j)))^2;
        end
    end
end
for k=1:max2
    if stroke_mean2(k)>0
    stroke_std2(k)=sqrt(var2(k)/skenum2(k))/stroke_mean2(k);
    else stroke_std2(k)=0;
    end
end

y=[arearatio1(:) lengthratio1(:) aspectratio1(:) occupyratio1(:) edgecontrast1(:) compact1(:) contourroughness1(:) ccholes1(:) arearatio_s1(:) boundary_s1(:) stroke_mean1(:) stroke_std1(:)
   arearatio2(:) lengthratio2(:) aspectratio2(:) occupyratio2(:) edgecontrast2(:) compact2(:) contourroughness2(:) ccholes2(:) arearatio_s2(:) boundary_s2(:) stroke_mean2(:) stroke_std2(:)];
 
