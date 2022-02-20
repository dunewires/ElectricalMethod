%t=tcpOpenMmtp;
regRead(t,"00000013");%heure
regRead(t,"00000012");%date

regRead(t,"00000039");
regRead(t,"0000003A");
regRead(t,"00000034");

regRead(t,"00000003");


regWrite(t,"00000003",'00000064');
regWrite(t,"00000004",'0000000A');
regWrite(t,"00000005",'000003E8');
regWrite(t,"00000006",'0000000A');
regWrite(t,"0000000A",'00000001');
regWrite(t,"0000000B",'00000001');

%checkA=regRead(t,"00000039");
%checkB=regRead(t,"0000003A");
%error=regRead(t,"00000034");

%r_stimFreqReq=regRead(t,"00000003");


%w_stimFreqReq=regWrite(t,"00000003",'00000064');
%w_stimFreqMin=regWrite(t,"00000004",'0000000A');
%w_stimFreqMax=regWrite(t,"00000005",'000003E8');
%w_stimFreqStep=regWrite(t,"00000006",'0000000A');
%w_cyclesPerFreq=regWrite(t,"0000000A",'00000001');
%w_adcSamplesPerCycle=regWrite(t,"0000000B",'00000001');


