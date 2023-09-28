% analyzePlate function
function [avgTemp, maxChangePoint] = analyzePlate(initialPlate, finalPlate)
    % average temperature
    avgTemp = mean(finalPlate(:));
    
    % maximum temperature change and its location
    diffPlate = abs(finalPlate - initialPlate);
    [maxChange, maxChangeIdx] = max(diffPlate(:));
    [maxChangeRow, maxChangeCol] = ind2sub(size(finalPlate), maxChangeIdx);
    maxChangePoint = [maxChangeRow, maxChangeCol];
end
