function[data] =  setUdp(tcpObj,addr)
header = 'abcd1234';
type = 'FE170003';
tcpPayload = hex2dec([header;type;addr]);
fwrite(tcpObj,tcpPayload, 'uint32')
anntest = fopen('anntest.txt','W')
fwrite(anntest,tcpPayload,'uint32')
fclose(anntest)