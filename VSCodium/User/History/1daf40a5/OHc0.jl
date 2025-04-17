using Plots

x = range(0, 10, length=100)
x = sin.(x)
y_noisy = @. sin(x) + 0.1*randn()

plot(x, y, label="sin(x)")
plot!(x, y_noisy, seriestype=:scatter, label="data")