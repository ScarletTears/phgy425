clear all; close all;

n=load_structure();

for i=1:5
	neuron=n(i);

	spikes=get_spikes(neuron);
	[burst,isolated,event]=spikeAnalysis(spikes);

	stim=upSampler(neuron);

	pos=[];
	for j=1:length(burst)
		idx=find(neuron.vtime==burst(j));
		pos=[pos stim(idx)];
	end

	figure; title(sprintf('Neuron %d',i));
	hist(pos,10);
end