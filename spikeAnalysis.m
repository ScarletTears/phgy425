function [burst,isolated,event] = spikeAnalysis(spiketimes)

	isis=get_isi(spiketimes);
	threshold=burst_threshold(isis);
	
	burst=[];
	event=[];  % set up the appropriate indices
	isolated=spiketimes; % initially all spikes are isolated
	
	I=2; % loop variable for the isis
	k=0; % 
	j=0;
	while I<=length(isis)-1 % this is a "while" loop 

	    if isis(I-1)>threshold && isis(I)<=threshold % we are at the beginning of a burst
	    event=[event spiketimes(I)]; % add the current index to "indices_events" as it belongs 
	    % to a burst
	    burst=[burst spiketimes(I) spiketimes(I+1)]; % also add it to the "indices_bursts"
	    dummy=I; % dummy variable which we set to the current value of I 
	    while isis(I)<=threshold && I<=length(isis)-1 % check if the next ISI is also less than threshold
	    burst=[burst spiketimes(I) spiketimes(I+1)];
	    I=I+1;
	    end
	    isolated=setdiff(isolated,spiketimes(dummy:I)); % remove the indices belonging to bursts from isolated
	    if I>dummy
		I=I-1; % go back one step
	    end
	    end
	I=I+1; % this is where we increment the variable
	end
	
end

function thres = burst_threshold(isi)
	thres = mean(isi(find(isi<std(isi))).^2);
end
