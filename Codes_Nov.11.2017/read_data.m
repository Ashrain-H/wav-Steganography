%    *   *   *   *   *   信 息    *   *   *   *   *    %
%               说明：信号与系统课程设计
%               编写者：通信一班-宋昊 
%               编写者学号：2016010901015
%               编写日期：2017.11.01
function read_data
k=7;a(1)=0;m=1;temp=[];
space_old=audioread('Test_dog.wav');
space_new=audioread('Test_dog0.wav');
% space_old=wavread('Test_dog.wav');
% space_new=wavread('Test_dog0.wav');旧版本MATLAB处理方式
for j=1:6
    a(1)=ceil(space_new(m*15,1)-space_old(m*15,1))*(10^(6-j))+a(1);
    m=m+1;
end
num=bin2dec(num2str((a(1))));
b(num,1)=0;
for i=1:num+1
    for j=1:6
    b(i,j)=space_new(k*15,1)-space_old(k*15,1);
    k=k+1;
    end
end
c=ceil(abs(b));
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
temp=char(temp)