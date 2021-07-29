function[tcpObj] = tcpOpenMmtp();
% Ref. http://www.mathworks.com/help/instrument/writing-and-reading-data_f16-57447.html
% Writing and Reading Data with a TCP/IP Object

%tcpObj = tcpip('192.168.76.147', 7);
%tcpObj = tcpip('192.168.2.10', 7); %38
%tcpObj = tcpip('128.103.100.138', 7); %palfrey
%tcpObj = tcpip('140.247.132.147', 7); %nw
tcpObj = tcpip('140.247.123.186', 7); %Jeff
%tcpObj = tcpip('140.247.132.199', 7); %NW mac 0
% Set size of receiving buffer, if needed. 
set(tcpObj, 'InputBufferSize', 30000); 
fopen(tcpObj);

