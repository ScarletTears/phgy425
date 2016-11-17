function plt = sample_plot(neuron, lims)
	vm=neuron.vm(lims);
	time=neuron.vtime(lims);

	thres=autoThres(neuron.vm);

	plot(time,vm); hold on;
	plot(time,thres.*ones(1,length(time)));
	hold off;
end