%    *   *   *   *   *   �� Ϣ    *   *   *   *   *    %
%        �ź���ϵͳ�γ���ơ��������������ݵ�д������ʵ��
%        ��д�ߣ�ͨ��һ��-��� 
%        ��д��ѧ�ţ�2016010901015
%        ��д���ڣ�2017.11.01
%        GitHub��https://github.com/Ashrain-H/wav-Steganography
%        Username:Ashrain-H
%    *   *   *   *   *   Credits  *   *   *   *   *    %
function insert_data(data_s,key)
% data_s='TobyFox-Undertale';
% key=8;�˴�Ϊ֮ǰ�Ĳ�������
jump=key;
if key<7
    disp('Error! Key must equal 7 or larger')
    return;
end
%�ַ�ת���������ѳɹ�ʵ������/��СдӢ��/��������,δ��������!��
 for i=2:length(data_s)+1
     temp_n(i)=double(data_s(i-1))-64;
 end
 data_n=abs(temp_n);
 data_n(1)=length(data_s);
data_n=num2str(dec2bin(data_n));
%space_w=wavread('Test_dog.wav');�ɰ汾MATLAB����ʽ
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