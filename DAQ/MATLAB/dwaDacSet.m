t=tcpOpenMmtp
pause(.2)
regWrite(t,'0000000C','AAAAAAA3')
tcpCloseMmtp(t);