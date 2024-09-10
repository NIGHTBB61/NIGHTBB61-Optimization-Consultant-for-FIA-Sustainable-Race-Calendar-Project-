param d{i in 1..22, j in 1..22};
var x{i in 1..22, j in 1..22: i<>j} binary;
var u{i in 1..22} >= 1;  
var y_sigapore binary;
var y_Jeddah binary;
var y_Lusail binary;
var y_half binary;
	
minimize travel_distance: sum{i in 1..22, j in 1..22: i<>j} x[i,j]*d[i,j];

subject to
in_visited_once{i in 1..22}: sum{j in 1..22: i<>j} x[i,j] = 1;
out_visited_once{j in 1..22}: sum{i in 1..22: i<>j} x[i,j] = 1;
SubtourElimination{i in 2..22, j in 2..22: i <> j}:
    u[i] - u[j] + 22*x[i,j] <= 21;

u_limit{i in 1..22}: u[i] <= 22;

montreal: u[9] >= 8;

singapore_1: u[16] <= 7 + 22*y_sigapore;
singapora_2: u[16] >= 18 - 22*(1-y_sigapore);

constraint_not_adjacent{(i,j) in {(6,17), (17,6), (17,20), (20,17), (6,20), (20,6)}}:
    x[i,j] = 0;
    
first_race_constraint: u[1] = 1;
last_race_constraint: u[22] = 22;


Monaco_1: u[8] <= 11 + 22 * y_half; 
Monaco_2: u[8] >= 12 - 22 * (1 - y_half);
SaoPaulo_1: u[19] <= 11 + 22 * (1 - y_half); 
SaoPaulo_2: u[19] >= 12 - 22 * y_half;


SuzukaShanghai: x[4,5] + x[5,4] = 1;


Jeddah: u[2] <= 11 + 22 * y_Jeddah;
Lusail: u[21] <= 11 + 22 * y_Lusail;
AtLeastOneFirstHalf: y_Jeddah + y_Lusail = 1;

# 1-21-2-15-12-10-7-8-14-13-11-19-6-9-17-18-20-4-5-3-16-22
# 40143.49
