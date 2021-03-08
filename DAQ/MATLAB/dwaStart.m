
t=tcpOpenMmtp

%start
regWrite(t,'00000000',"00000002");
pause(.2);

tcpCloseMmtp(t);