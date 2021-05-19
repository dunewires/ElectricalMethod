
t=tcpOpenMmtp
%reset n
regWrite(t,'00000001',"00000000") ;
pause(.2);
regWrite(t,'00000001',"00000001");
pause(.2);
tcpCloseMmtp(t);