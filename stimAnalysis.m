function [A,period,gamma,theta] = stimAnalysis(neuron)

	rg=round(0.45*length(neuron.pos));
	sample=neuron.pos(rg:end-rg);
	t=neuron.stime(rg:end-rg);

	A=round(max(sample));

	downSample=sample(1:20:round(length(sample)/20)*20);
	downT=t(1:20:round(length(t)/20)*20);
	peak=[];
	for i=2:length(downSample)-1
		if downSample(i) > downSample(i-1) && downSample(i) > downSample(i+1)
			peak=[peak downT(i)];
		end
	end

	period=diff(peak);
	buff=round(period);
	idx=find(buff==mode(buff));
	period=1/mean(period(idx));

	fit = @(b,downT)  b(1).*sin(2*pi*b(2).*downT + b(3));    % Function to fit
	fcn = @(b) sum((fit(b,downT) - downSample).^2);                              % Least-Squares cost function
	s = fminsearch(fcn, [A;  period;  -1])   

	xp = linspace(min(downT),max(downT));

	figure(1)
	plot(t,y,'b',  xp,fit(s,xp), 'r')
	grid

end