t=tcpOpenMmtp

%acStim_nPeriod
regRead(t,"0000000F")
%acStimX200_nPeriod
regRead(t,"00000010")
%ctrl busy
regRead(t,"00000011")
% constant
regRead(t,"00000012")

% fifoAutoDC_ff fifoAutoDC_ef
regRead(t,"0000001B")

tcpCloseMmtp(t);