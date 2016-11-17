% takes as input either neuron struct or spikestrains

function psth = get_psth(neurons)
	
	if isstruct(neurons)
		spiketrains=cell(1,length(neurons));
	
		for i=1:length(neurons)
			spiketrains{i}=get_spikes(neurons(i));
			spiketrains{i}=spikeAnalysis(spiketrains{i});
		end
	else
		spiketrains=neurons;
	end

	hold on;
	for i=1:length(spiketrains)
		plot(spiketrains{i},i.*ones(1,length(spiketrains{i})),'.');
	end
	
	title('PSTH');
	ylabel('neuron');
	xlabel('time');
	hold off;
end
