function J = imagebw(input)
  %%inputΪ������ͼ��JΪ�����ֵ����ͼ
%�ο�����[1] Otsu, N., "A Threshold Selection Method from Gray-Level Histograms,
%" IEEE Transactions on Systems, Man, and Cybernetics, Vol. 9, No. 1, 1979, pp. 62-66.
%����ֱ��ͼ��Ϣѡȡ���ޣ������ֵ��
I = im2uint8(input(:));  %%ǿ�Ʊ��uint8����--������������
num_graylevel = 256;  %�Ҷȼ�Ϊ256
gray_nums = imhist(I,num_graylevel);  %ԭͼ�еĸ����Ҷȼ���Ƶ��
probability = gray_nums / sum(gray_nums);  %ÿ���Ҷȼ����ֵĸ���
accu = cumsum(probability);  %��С�ڸ������ʵ��ۻ�����
a_num = cumsum(probability .* (1:num_graylevel)'); %�õ�С�ڸ����Ҷȼ��������ۻ�����
a_numlast = a_num(end); %a_num���������һ������ָ���ǣ��Ҷȼ�*��Ӧ�ĸ��ʣ����ܺ�
sigma_b_squared = (a_numlast * accu - a_num).^2 ./ (accu .* (1 - accu));
maxval = max(sigma_b_squared);    %ȡ�����ֵ
isfinite_maxval = isfinite(maxval);  %�ų���̬
  if isfinite_maxval
    idx = mean(find(sigma_b_squared == maxval)); 
    % Normalize the threshold to the range [0, 1].
    threshold = (idx - 1) / ( num_graylevel - 1); %��������
  else
    threshold = 0.0;%�����ǲ�̬������Ϊ��
  end
  J=im2bw(input,threshold);      %��ֵ��
