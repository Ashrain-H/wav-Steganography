%    *   *   *   *   *    �� Ϣ   *   *   *   *   *    %
%        �ź���ϵͳ�γ���ơ��������������ݵ�д������ʵ��
%        ��д�ߣ�ͨ��һ��-��� 
%        ��д��ѧ�ţ�2016010901015
%        ��д���ڣ�2017.11.01
%        GitHub��https://github.com/Ashrain-H/wav-Steganography
%        Username:Ashrain-H
%    *   *   *   *   *   Credits  *   *   *   *   *    %
function read_data(key)
k=7;a(1)=0;m=1;temp=[];
space_old=audioread('Test_dog.wav');
space_new=audioread('Test_dog0.wav');
% space_old=wavread('Test_dog.wav');
% space_new=wavread('Test_dog0.wav');�ɰ汾MATLAB����ʽ
%(Please apply this to lower version MATLAB(s))

%This function reads the length of the data (binary numbers)
%��������ܹ���ȡ��Ϣ�Ķ����ƴ�����
for j=1:6
    a(1)=ceil(space_new(m*key,1)-space_old(m*key,1))*(10^(6-j))+a(1);
    m=m+1;
end
num=bin2dec(num2str((a(1))));
b(num,1)=0;

%This function reads the data (binary numbers)
%��������ܹ���ȡ��Ϣ�Ķ����ƴ�
for i=1:num+1
    for j=1:6
    b(i,j)=space_new(k*key,1)-space_old(k*key,1);
    k=k+1;
    end
end
c=ceil(abs(b));

%Seperate recreate symbols and characters.
%�Է��ź���ĸ��ȡ��ͬ�Ļ�ԭ��ʽ
i=1;
while i<length(c)
if sum(b(i,:))<0
temp(i)=64-bin2dec(num2str((c(i,:))));
i=i+1;
elseif sum(b(i,:))>=0
 temp(i)=64+bin2dec(num2str((c(i,:))));
 i=i+1;
end
end

%Disp the data!
temp=char(temp)