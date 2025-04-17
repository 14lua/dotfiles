using Pkg
Pkg.add("Plots")
using Plots

x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)
plot(x, [y1, y2])

y3 = @. sin(x)^2 - 1/2