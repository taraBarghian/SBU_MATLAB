
function result = func7(a,b,c,d,varargin)
switch nargin
        case 2
            result = a - b;
        case 3
            result = a + b + c;
        case 4
            result = a * b * c* d;
        otherwise
            disp("The maximum allowed input of the function is 4!");
end
end

