
t=tcpOpenMmtp
%reset n
regWrite(t,'00000000',"00000001");
pause(.2);
tcpCloseMmtp(t);