%    *   *   *   *   *   信 息    *   *   *   *   *    %
%        信号与系统课程设计——波形声音数据叠写技术的实现
%        编写者：通信一班-宋昊 
%        编写者学号：2016010901015
%        编写日期：2017.11.01
%        GitHub：https://github.com/Ashrain-H/wav-Steganography
%        Username:Ashrain-H
%    *   *   *   *   *   Credits  *   *   *   *   *    %
function insert_data(data_s,key)
% data_s='TobyFox-Undertale';
% key=8;此处为之前的测试数据
jump=key;
if key<7
    disp('Error! Key must equal 7 or larger')
    return;
end
%字符转换函数（已成功实现数字/大小写英文/符号输入,未适配中文!）
 for i=2:length(data_s)+1
     temp_n(i)=double(data_s(i-1))-64;
 end
 data_n=abs(temp_n);
 data_n(1)=length(data_s);
data_n=num2str(dec2bin(data_n));
%space_w=wavread('Test_dog.wav');旧版本MATLAB处理方式
%(Please apply this to lower version MATLAB(s))
space_w=audioread('Test_dog.wav');
for i=1:size(data_n,1)
    if temp_n(i)<0
        for j=1:size(data_n,2)
        a=data_n(i,j);
        if a=='1'
            space_w(key,1)=space_w(key,1)-0.0001;
        end %Apply this to symbols and numbers
        key=key+jump;
        end   
    elseif temp_n(i)>=0
    for j=1:size(data_n,2)
        a=data_n(i,j);
        if a=='1'
            space_w(key,1)=space_w(key,1)+0.0001;
        end
        key=key+jump;
    end
    end
end
audiowrite('Test_dog0.wav',space_w,44100);
disp(['Insert is finished,please remember the key:',num2str(jump)])