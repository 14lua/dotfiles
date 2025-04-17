using Plots

x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)
y3 = @. sin(x)^2 - 1/2

plot(x, [y1 y2], label=["sin(x) cos(x)"], lw=[2 1])
plot!(x, y3, label="sin(x)^2 - 1/2", lw=3, ls=:dot)