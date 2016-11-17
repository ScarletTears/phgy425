% save mat files into workspace and return file names

function files = loadfiles()
	system('rm files.mat');

	files=dir('*.mat');
	for i=1:length(files)
		eval(['load ' files(i).name]);
		files(i).name=['V' files(i).name(1:end-4)];
	end
	
	clear ans i;
	save('files.mat');
end
