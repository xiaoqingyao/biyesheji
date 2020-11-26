function J = imagebw(input)
  %%input为待处理图像，J为输出二值化的图
%参考文献[1] Otsu, N., "A Threshold Selection Method from Gray-Level Histograms,
%" IEEE Transactions on Systems, Man, and Cybernetics, Vol. 9, No. 1, 1979, pp. 62-66.
%运用直方图信息选取门限，而后二值化
I = im2uint8(input(:));  %%强制变成uint8类型--并且是向量型
num_graylevel = 256;  %灰度级为256
gray_nums = imhist(I,num_graylevel);  %原图中的各个灰度级的频数
probability = gray_nums / sum(gray_nums);  %每个灰度级出现的概率
accu = cumsum(probability);  %求小于各个概率的累积概率
a_num = cumsum(probability .* (1:num_graylevel)'); %得到小于各个灰度级的像素累积数量
a_numlast = a_num(end); %a_num向量的最后一个数，指的是（灰度级*对应的概率）的总和
sigma_b_squared = (a_numlast * accu - a_num).^2 ./ (accu .* (1 - accu));
maxval = max(sigma_b_squared);    %取得最大值
isfinite_maxval = isfinite(maxval);  %排除病态
  if isfinite_maxval
    idx = mean(find(sigma_b_squared == maxval)); 
    % Normalize the threshold to the range [0, 1].
    threshold = (idx - 1) / ( num_graylevel - 1); %计算门限
  else
    threshold = 0.0;%倘若是病态，门限为零
  end
  J=im2bw(input,threshold);      %二值化
