
t=tcpOpenMmtp

%start
regWrite(t,'00000000',"00000010");
pause(.2);

tcpCloseMmtp(t);