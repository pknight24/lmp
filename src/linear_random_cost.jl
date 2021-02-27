using JuMP, SCS

n = 10;
A = rand(n,n)
sigma = A * A'
cbar = randn(n)
gamma = 0.8


model = Model(SCS.Optimizer)
@variable(model, 0 <= x[1:n] <= 1)
@constraint(model, con, sum(x) == 1)
@objective(model, Min, cbar' * x + gamma * x' * sigma * x)
optimize!(model)
