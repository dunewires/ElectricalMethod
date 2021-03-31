function[data] = udpRecDsp()
LocalIPPort = 'LocalIPPort';
port = 6008;
maxPacketLength = 1024;
file = '/home/nate/cernbox/shared/dune/matlab/dwaUdpData.txt';
timeout = 300;% in seconds
% make sure to read before the input buffer 8K? fills up
readInterval = .01;
bufSize = 65536

%clear out existing files
	disp("setup files");
    dlmwrite(file,[],'w');

H = dsp.UDPReceiver(LocalIPPort,port,'MaximumMessageLength',maxPacketLength,'ReceiveBufferSize',bufSize)
step(H);%not sure why this first step is needed ??
count = 1;

while count < timeout * 1/readInterval
    udpPacket = dec2hex(step(H));
    udpData = reshape(udpPacket',8,[])';
    if isempty(udpPacket) == 0
    	disp("bing!");
    	udpData
        dlmwrite(file,udpData(1:end,:),'-append','delimiter','');
        count = 1;
    end
    pause(readInterval)
end
disp('UDP Timeout')
release(H)
