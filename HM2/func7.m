
function result = func7(a,b,c,d,varargin) %use varargin to make possible any number of inputs

err="The allowed range is [2,4] !"; %error messege
    switch nargin
        case 2
            result = a - b;
        case 3
            result = a + b + c;
        case 4
            result = a * b * c* d;
        otherwise
            error(err);
    end
end

