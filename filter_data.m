% band-pass filter
% if no fc specified, default to 300-3k Hz

function filtered = filter_data(data,fs,fc)
	if nargin==2
		fc=[300 3000];
	end
	[b,a] = butter(4, fc./([fs fs]./2));
	filtered=filtfilt(b,a,double(data));
end