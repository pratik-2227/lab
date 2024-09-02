% Define the grid dimensions and cell characteristics
grid_dim = 3; % Grid is 3x3
cell_dim = 5; % Each cell is 5x5 meters

% Example travel times for each shot (replace these with actual measurements)
travel_times = [0.1; 0.15; 0.2; 0.25; 0.3; 0.35; 0.4; 0.45; 0.5]; 

% Initialize the G matrix and identity matrix for regularization
G_matrix = zeros(length(travel_times), grid_dim * grid_dim);
identity_matrix = ones(length(travel_times), grid_dim * grid_dim);

% Define shot paths and fill the G matrix accordingly
% Shot 1: Across cells 1, 2, 3
G_matrix(1, [1 2 3]) = cell_dim; 

% Shot 2: Across cells 4, 5, 6
G_matrix(2, [4 5 6]) = cell_dim;

% Shot 3: Across cells 7, 8, 9
G_matrix(3, [7 8 9]) = cell_dim;

% Shot 4: Diagonal path from cells 1, 5, 9
G_matrix(4, [1 5 9]) = [sqrt(2)*cell_dim, sqrt(2)*cell_dim, sqrt(2)*cell_dim]; 

% Shot 5: Diagonal path from cells 3, 5, 7
G_matrix(5, [3 5 7]) = [sqrt(2)*cell_dim, sqrt(2)*cell_dim, sqrt(2)*cell_dim]; 

% Shot 6: Vertical path through cells 1, 4, 7
G_matrix(6, [1 4 7]) = cell_dim;

% Shot 7: Vertical path through cells 2, 5, 8
G_matrix(7, [2 5 8]) = cell_dim;

% Shot 8: Vertical path through cells 3, 6, 9
G_matrix(8, [3 6 9]) = cell_dim;

% Shot 9: Diagonal path through cells 4, 2
G_matrix(9, [4 2]) = [sqrt(2)*cell_dim, sqrt(2)*cell_dim]; 

% Solve for the slowness vector 's_vector' using regularized inversion
s_vector = (G_matrix + 0.1 * identity_matrix) \ travel_times;
s_vector_2 = (G_matrix' * G_matrix) \ (G_matrix' * travel_times);

% Display the slowness results
disp('Calculated slowness values for each grid cell:');
disp(s_vector_2);

% Reshape the slowness vector into a 3x3 grid for easier visualization
slowness_reshaped = reshape(s_vector, [grid_dim, grid_dim]);
disp('Slowness grid:');
disp(slowness_reshaped);
