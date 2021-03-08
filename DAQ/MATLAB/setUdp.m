function[data] =  setUdp(tcpObj,addr)%addr is hex format ip address 
header = 'abcd1234';
type = 'FE170003'; %command for udp set
tcpPayload = hex2dec([header;type;addr]);
fwrite(tcpObj,tcpPayload, 'uint32')