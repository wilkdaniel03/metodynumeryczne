classdef taylor
	methods(Static)
		function sine = sine(angle)
			sine = 0.;
			for r = 0:10
				upper = ((-1) .^ r) * (angle .^ (2. .* r + 1.));
				lower = factorial(2. .* r + 1.);
				res = upper ./ lower;
				sine = sine + res;
			end
		end

		function cosine = cosine(angle)
			cosine = 0.;
			for r = 0:10
				upper = ((-1) .^ r) * (angle .^ (2. .* r));
				lower = factorial(2. .* r);
				res = upper ./ lower;
				cosine = cosine + res;
			end
		end

	end
end
