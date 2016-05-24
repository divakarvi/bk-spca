n = 1000*1000*10

tic()
p = zeros(n, 1);
p(1) = 0;
p(2) = 1;
ksqrt =  1;
for k = 3:n
    if (ksqrt * ksqrt < k)
       ksqrt = ksqrt + 1;
    end
    p(k) = 1;
    for j = 2:ksqrt
	if (mod(k,j) == 0)
	   p(k) = 0;
	   break
	end
    end
end
secs = toc();
secs
CPUGHZ = 3.6;
cycles = secs * CPUGHZ * 1e9;
cycles
sum(p)
