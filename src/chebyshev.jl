using JuMP, GLPK, LinearAlgebra
a1 = -1;
b1 = 0;
a2 = 2.2;
b2 = 4.5;

model = Model(GLPK.Optimizer);
@variable(model, xc);
@variable(model, 0 <= r);
@constraint(model, hs1, dot(a1, xc) + r * norm(a1) <= b1)
@constraint(model, hs2, dot(a2, xc) + r * norm(a2) <= b2)
@objective(model, Max, r)
optimize!(model)
