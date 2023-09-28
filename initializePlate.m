% Define initializePlate function
function plate = initializePlate(n)
    plate = zeros(n, n); 
    plate(:, :) = 25;% The initial temperature is 25°C
    % boundary temperatures
    plate(1, :) = 100;% Top boundary 100°C
    plate(n, :) = 50;% Bottom boundary 50°C
    plate(:, 1) = 0;% Left boundary 0°C
    plate(:, n) = 75;% Right boundary 75°C
    plate(1, 1) = (plate(1, 2) + plate(2, 1)) / 2;% Corner temperature
    plate(1, n) = (plate(1, n-1) + plate(2, n)) / 2;% Corner temperature
    plate(n, 1) = (plate(n-1, 1) + plate(n, 2)) / 2;% Corner temperature
    plate(n, n) = (plate(n-1, n) + plate(n, n-1)) / 2;% Corner temperature
end
