% updateTemperature function
function updatedPlate = updateTemperature(plate)
    n = size(plate, 1);
    updatedPlate = plate;
    
    for i = 2:n-1
        for j = 2:n-1
            % new temperature based on the closest 4 points
            updatedPlate(i, j) = (plate(i+1, j) + plate(i-1, j) + plate(i, j+1) + plate(i, j-1)) / 4;
        end
    end
end
