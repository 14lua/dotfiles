using Pkg
Pkg.add("Plots")
using Plots

x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)
p = plot(x, [y1, y2])

y3 = @. sin(x)^2 - 1/2
plot!(p, x, y3)