function[dataHex] =  regRead(tcpObj,addr)
header = 'abcd1234';
type = 'FE170001';
tcpPayload = hex2dec([header;type;addr]);
fwrite(tcpObj,tcpPayload, 'uint32');
timeout = 20;
timeWait= 0;
dataHex = [];
while ((get(tcpObj, 'BytesAvailable') == 0) && timeWait < timeout)
    pause(.1);
    timeWait = timeWait+1;
end

while(get(tcpObj, 'BytesAvailable') > 0)
    DataReceived = dec2hex(fread(tcpObj,tcpObj.BytesAvailable/4,'uint32'));
 dataHex = DataReceived(3,:);
end
