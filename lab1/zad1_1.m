% f(x) = sin(x^2), x = 0.5, h = 1

function sine = sine_taylor(angle)
	sine = 0.;
	for r = 0:10
		upper = ((-1) .^ r) * (angle .^ (2. .* r + 1.));
		lower = factorial(2. .* r + 1.);
		res = upper ./ lower;
		sine = sine + res;
	end
end

function cosine = cosine_taylor(angle)
	cosine = 0.;
	for r = 0:10
		upper = ((-1) .^ r) * (angle .^ (2. .* r));
		lower = factorial(2. .* r);
		res = upper ./ lower;
		cosine = cosine + res;
	end
end

% Pierwsza metoda
function deriv_one(x,h)
	for r = 0:10
		upper = sine_taylor(x + h) - sine_taylor(x);
		deriv = upper ./ h;
		fprintf("[%i] %f\n",r,deriv);
		h = h ./ 2;
	end
end

% Druga metoda
function deriv_two(x,h)
	for r = 0:10
		upper = sine_taylor(x + h) - sine_taylor(x - h);
		lower = 2. * h;
		deriv = upper ./ lower;
		fprintf("[%i] %f\n",r,deriv);
		h = h ./ 2;
	end
end

% f'(x) = 2*x*cos(x^2)
% f'(0.5) = 2*0.5*cos(0.25) = 1*cos(0.25)
fprintf("%f\n",cosine_taylor(0.25));
fprintf("---------------------------");
% Pierwsza metoda
deriv_one(0.25,1)
fprintf("---------------------------");
% Druga metoda
deriv_two(0.25,1)
