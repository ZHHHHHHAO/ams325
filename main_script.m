% Initialize a plate
n = 50; % The size of plate

% Information for initial picture
plate = initializePlate(n);
figure;
imagesc(plate);
colorbar;
title('Initial Temperature Distribution');
saveas(gcf, 'initial_temperature.png');

% For iteration
threshold = 0.01; % The minimum change of tempure
maxChange = Inf; 
initialPlate = plate;
iteration = 0; % Counting how many times

% For movie creation
F(n) = struct('cdata',[],'colormap',[]);
while maxChange > threshold
    updatedPlate = updateTemperature(plate);
    maxChange = max(max(abs(updatedPlate - plate)));
    plate = updatedPlate;
    iteration = iteration + 1;
    
    % Show the current temperature distribution
    imagesc(plate);
    title(['Iteration ', num2str(iteration)]);
    F(iteration) = getframe(gcf);
end

% Save in MP4 format
v = VideoWriter('temperature_evolution','MPEG-4');
% Information about the quality of movie
v.Quality = 90;
v.FrameRate = 60;
open(v);
writeVideo(v, F);
close(v);

% Analyze the plate
[avgTemp, maxChangePoint] = analyzePlate(initialPlate, plate);

% Plot the temperature distribution along the diagonal
figure;
plot(diag(plate));
title('Temperature Distribution Along the Diagonal');
xlabel('Position Along Diagonal');
ylabel('Temperature (°C)');
saveas(gcf, 'diagonal_temperature.png');