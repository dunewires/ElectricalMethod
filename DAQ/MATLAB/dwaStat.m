t=tcpOpenMmtp

%ctrlbusy
regRead(t,"00000010")
%dateCode
regRead(t,"00000013")
% hashCode
regRead(t,"00000014")

tcpCloseMmtp(t);