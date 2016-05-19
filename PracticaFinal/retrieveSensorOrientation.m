function Data = retrieveSensorOrientation(m,trim)

measure = m.Orientation';

if isempty(measure)
    Data = measure;
else
    
    if nargin<2
        Data = [-1;1;1].*measure;
    else
        Data = [-1;1;1].*measure-trim;
    end
end