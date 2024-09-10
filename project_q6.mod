param d{i in 1..22, j in 1..22};
var x{i in 1..22, j in 1..22: i<>j} binary;
var u{i in 1..22} >= 1;  

	
minimize travel_distance: sum{i in 1..22, j in 1..22: i<>j} x[i,j]*d[i,j];

subject to
in_visited_once{i in 1..22}: sum{j in 1..22: i<>j} x[i,j] = 1;
out_visited_once{j in 1..22}: sum{i in 1..22: i<>j} x[i,j] = 1;
SubtourElimination{i in 2..22, j in 2..22: i <> j}:
    u[i] - u[j] + 22*x[i,j] <= 21;
