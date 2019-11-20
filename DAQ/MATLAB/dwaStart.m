
t=tcpOpenMmtp

%start
regWrite(t,'00000009',"00000001");
pause(.2);
regWrite(t,'00000009',"00000000");
pause(.2);

tcpCloseMmtp(t);