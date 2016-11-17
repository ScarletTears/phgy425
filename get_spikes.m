% takes as input vm/lfp signal and time bins and returns spiketrain
% if no threshold is given use autoThres

function spiketimes = get_spikes(neuron, thres)
	Vm=neuron.vm;
	timeaxis=neuron.vtime;
	if nargin==1
		thres=autoThres(Vm);
	end

	spiketimes=[];
	for j=1:length(timeaxis) - 1 % for every time point
		if(Vm(j) < thres && Vm(j+1) >= thres) % if Vm at j is greater than threshold
			spiketimes=[spiketimes timeaxis(j)]; % add spiketime to vector
		end
	end
end
