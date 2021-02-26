using JuMP, SCS
using RDatasets

iris = dataset("datasets", "iris");
X = iris[:,1:3] |> Matrix
Y = iris[:,4]

model = Model(SCS.Optimizer)
@variable(model, 0 <= b[1:3] <= 1)
@objective(model, Min, (X * b - Y)' * (X * b - Y))
optimize!(model)
