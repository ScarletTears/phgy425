function trains = plot_trains(neuron)
	
	spiketrain=get_spikes(neuron);
	[burst_train,isolated,event]=spikeAnalysis(spiketrain);
	
	hold on; % new subplot
	for j=1:length(spiketrain) % plot spike trains for bursts, isolated, all spikes
		plot([spiketrain(j) spiketrain(j)],[0 1],'b'); hold on;
	end
	for j=1:length(burst_train)
		plot([burst_train(j) burst_train(j)],[2 3],'r');
	end
	for j=1:length(isolated)
		plot([isolated(j) isolated(j)],[4 5],'g');
	end
	for j=1:length(event)
		plot([event(j) event(j)],[6 7],'c');
	end
	
	title('Spiketrains analysis'); % name plot
	set(gca,'ytick',0.5:1:6.5,'yticklabel',{'spiketrain','','Bursts','','Isolated','','Events'}); % label axis
	xlabel('Time (sec)');
end
