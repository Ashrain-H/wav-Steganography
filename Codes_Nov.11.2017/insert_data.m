%    *   *   *   *   *   �� Ϣ    *   *   *   *   *    %
%               ˵�����ź���ϵͳ�γ����
%               ��д�ߣ�ͨ��һ��-��� 
%               ��д��ѧ�ţ�2016010901015
%               ��д���ڣ�2017.11.01
%               ��������ͬ����GitHub
function insert_data
data_s='TobyFox-Undertale';n=15;jump=15;
%�ַ�ת���������ѳɹ�ʵ������/��СдӢ��/��������,δ��������!��
 for i=2:length(data_s)+1
     temp_n(i)=double(data_s(i-1))-64;
 end
 data_n=abs(temp_n);
 data_n(1)=length(data_s);
data_n=num2str(dec2bin(data_n));
%space_w=wavread('Test_dog.wav');�ɰ汾MATLAB����ʽ
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