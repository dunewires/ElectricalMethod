function[data] =  regWrite(tcpObj,addr,data)
header = 'abcd1234';
type = 'FE170002';
tcpPayload = hex2dec([header;type;addr;data]);
fwrite(tcpObj,tcpPayload, 'uint32');
anntest = fopen('anntest.txt','W');
fwrite(anntest,tcpPayload,'uint32');
fclose(anntest);