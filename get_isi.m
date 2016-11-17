function [isi,cv] = get_isi(spiketimes, bins)

	isi=diff(spiketimes); % get ISI sequence
	cv=std(isi)/mean(isi); % calculate the CV

	if nargin==2
	
		edges=linspace(0,max(isi),bins); % 60 bins seems to give best result
		histogram=histc(isi,edges); % create histogram
		bar(edges,histogram); % plot histogram from values
		xlim([0-edges(2) max(isi)]); % rescale x axis
		xlabel('ISI (ms)'); % label axis
		ylabel('Number');
	end
end
