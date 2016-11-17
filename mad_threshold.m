% get threshold using median absolute deviation, whatever that is...

function thres = mad_threshold(vm)
	X=vm(find(vm>=mean(vm)));
	thres=mean(abs(X-mean(X)));
end
