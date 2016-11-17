function thres = autoThres(vm)
	thres=5*median(abs(vm)/0.6745);
end