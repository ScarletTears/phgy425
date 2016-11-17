% construct structure

function n = load_structure()

	load files.mat;

	for i=1:length(files)
		try
			stimulus=eval([files(i).name '_Ch5']);
			Vm=eval([files(i).name '_Ch13']);
		catch
			stimulus=eval([files(i).name '_Ch4']);
			Vm=eval([files(i).name '_Ch6']);
		end
	
		stime=stimulus.interval*(0:1:length(stimulus.values)-1);
		vtime=Vm.interval*(0:1:length(Vm.values)-1);
	
		n(i).stime=stime;
		n(i).vtime=vtime;
		n(i).pos=stimulus.values;
		n(i).vm=Vm.values;
		n(i).start=stimulus.start;
		n(i).sample_rate=1/Vm.interval;
		n(i).sint=stimulus.interval;
		n(i).vint=Vm.interval;
	
	end

end
