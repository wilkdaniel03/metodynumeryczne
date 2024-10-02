% f(x) = sin(x^2), x = 0.5, h = 1

% Pierwsza metoda
function deriv_one(x,h)
	for r = 0:10
		upper = taylor.cosine(x + h) - taylor.cosine(x);
		deriv = upper ./ h;
		fprintf("[%i] %f\n",r,deriv);
		h = h ./ 2;
	end
end

% Druga metoda
function deriv_two(x,h)
	for r = 0:10
		upper = taylor.cosine(x + h) - taylor.cosine(x - h);
		lower = 2. * h;
		deriv = upper ./ lower;
		fprintf("[%i] %f\n",r,deriv);
		h = h ./ 2;
	end
end

% f'(x) = -2*x*sin(x^2)
% f'(0.5) = -2*0.5*sin(0.25) = -1*sin(0.25)
fprintf("%f\n",taylor.sine(0.25) * (-.1));
fprintf("---------------------------");
% Pierwsza metoda
deriv_one(0.25,1)
fprintf("---------------------------");
% Druga metoda
deriv_two(0.25,1)
