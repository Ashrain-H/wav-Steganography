%    *   *   *   *   *   信 息    *   *   *   *   *    %
%               说明：信号与系统课程设计
%               编写者：通信一班-宋昊 
%               编写者学号：2016010901015
%               编写日期：2017.11.01
%               本代码已同步至GitHub
function insert_data
data_s='TobyFox-Undertale';n=15;jump=15;
%字符转换函数（已成功实现数字/大小写英文/符号输入,未适配中文!）
 for i=2:length(data_s)+1
     temp_n(i)=double(data_s(i-1))-64;
 end
 data_n=abs(temp_n);
 data_n(1)=length(data_s);
data_n=num2str(dec2bin(data_n));
%space_w=wavread('Test_dog.wav');旧版本MATLAB处理方式
space_w=audioread('Test_dog.wav');
for i=1:size(data_n,1)
    if temp_n(i)<0
        for j=1:size(data_n,2)
        a=data_n(i,j);
        if a=='1'
            space_w(n,1)=space_w(n,1)-0.0001;
        end
        n=n+jump;
        end   
    elseif temp_n(i)>=0
    for j=1:size(data_n,2)
        a=data_n(i,j);
        if a=='1'
            space_w(n,1)=space_w(n,1)+0.0001;
        end
        n=n+jump;
    end
    end
end
audiowrite('Test_dog0.wav',space_w,44100);