function k_pc = pov_k_pc(var_vector)

% Find the optimal K value by using proportion of variance.


best_value = 0.90;
total_var = sum(var_vector);
numerator = 0;
pov = 0;
k_pc = 0;

while pov <= best_value
    k_pc = k_pc + 1;
    numerator = numerator + var_vector(k_pc);
    pov = numerator / total_var;
end
