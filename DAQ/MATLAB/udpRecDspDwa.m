function[data] = udpRecDsp()
LocalIPPort = 'LocalIPPort';
port = 6008;
maxPacketLength = 1024;
fileName = 'mmTest';
fileExt = '.txt';
timeout = 300;% in seconds
% make sure to read before the input buffer 8K? fills up
readInterval = .01;
bufSize = 65536

%clear out existing files
for ind = 32:35
	disp("setup files");
    file = [fileName,dec2hex(ind,2),fileExt]
    dlmwrite(file,[],'w');
end

H = dsp.UDPReceiver(LocalIPPort,port,'MaximumMessageLength',maxPacketLength,'ReceiveBufferSize',bufSize)
step(H);%not sure why this first step is needed ??
count = 1;
runCount = 1;
errorCount = 0;

while count < timeout * 1/readInterval
    udpPacket = dec2hex(step(H));
    udpData = reshape(udpPacket',8,[])';
    if isempty(udpPacket) == 0
    	disp("bing!");
    udpData
		      file = [fileName,udpData(2,7:8),fileExt];
		      strbs =         udpData(3:9:end,3:4);
		      headers =         udpData(3:9:end,6:8);
		      spacer = repmat(' - ',size(strbs,1),1);

%%% Hit Data 
		      if file(8) == '0' %select data to print
		      disp(['      ' ,file, 'PACKET #: ', num2str(runCount)])
		      hitData =      udpData(3:end,:);
		      hitData(1:9:end,:) =   []; %remove headers
		      hitData = reshape(hitData',32,[])';
		      hitDataStrips = hitData(1:2:end,:);
		      hitDataSlope = hitData(2:2:end,:);
			hitDataStrips = reshape(hitDataStrips',4,[])';
		   	hitDataSlope = reshape(hitDataSlope',4,[])';
		      hitDataStrips= [hitDataStrips, repmat(' ',size(hitDataStrips,1),1)];
					       hitDataStrips= reshape(hitDataStrips',40,[])';



								      disp([strbs, spacer, headers,spacer, hitDataStrips])
		      simStrb= ['F0';'0F';'F0';'0F';'50';'0A';'F0';'07';'F0';'0B'];
		      if length(simStrb) == length(strbs)
		      difStrb = dec2bin(hex2dec(strbs)) - dec2bin(hex2dec(simStrb));
		      if max(any(difStrb))
		        disp(difStrb)
		        errorCount = errorCount + 1;
		        end;
		      else 
			disp('----------------------------Dropped HIT event!');
    		        errorCount = errorCount + 1;

		      end
		      disp(['    - Error Count: ',num2str(errorCount),' > ',num2str(errorCount/runCount*100),'%  '])


		      runCount = runCount + 1;
		      disp('***********************************************************');
		      end 


%%%%% Track Data
		      if file(8) == '3' %select data to print
		      disp(['      ' ,file, 'PACKET #: ', num2str(runCount)])
		      disp([strbs spacer headers])
		      simStrb= ['FF';'FF';'66';'BF';'EF'];
		      if length(simStrb) == length(strbs)
		      difStrb = dec2bin(hex2dec(strbs)) - dec2bin(hex2dec(simStrb));
		      if max(any(difStrb))
		        disp(difStrb)
		        errorCount = errorCount + 1;
		        end;
		      else 
			disp('--------------------------Dropped track event!');
    		        errorCount = errorCount + 1;

		      end


		      disp(['    - Error Count: ',num2str(errorCount),' > ',num2str(errorCount/runCount*100),'%  '])
		      runCount = runCount + 1;
		      disp('***********************************************************');

		      end

%%%%% gbt Data
		      if file(8) == '1' %select data to print
		      disp(['      ' ,file, 'PACKET #: ', num2str(runCount)])
		      spacer = repmat(' ',length(udpData)-2,1);
		     gbtData = reshape([udpData(3:end,:),spacer]',[],20);

		      disp (gbtData')
		   %   disp([strbs spacer headers])
		   %   simStrb= ['FF';'FF';'66';'BF';'EF'];
		   %   if length(simStrb) == length(strbs)
		   %   difStrb = dec2bin(hex2dec(strbs)) - dec2bin(hex2dec(simStrb));
		   %   if max(any(difStrb))
		   %     disp(difStrb)
		   %     errorCount = errorCount + 1;
		   %     end;
		   %   else 
		%	disp('--------------------------Dropped track event!');
    		   %     errorCount = errorCount + 1;

		  %    end


		 %     disp(['    - Error Count: ',num2str(errorCount),' > ',num2str(errorCount/runCount*100),'%  '])
		  %    runCount = runCount + 1;
		      disp('***********************************************************');

		      end


 
       dlmwrite(file,udpData(3:end,:),'-append','delimiter','');
        %type(file)
        count = 1;
    end
    pause(readInterval)
    count = count + 1;
end
disp('UDP Timeout')
release(H)
