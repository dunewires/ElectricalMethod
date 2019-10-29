function tcpCloseMmtp(tcpObj);
% Ref. http://www.mathworks.com/help/instrument/writing-and-reading-data_f16-57447.html
% Writing and Reading Data with a TCP/IP Object

% Disconnect and clean up the server connection. 
fclose(tcpObj); 
delete(tcpObj); 
clear tcpObj 
