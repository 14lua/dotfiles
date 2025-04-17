using Plots

x = range(0, 10, length=100)
x = sin.(x)
y_noisy = @. sin(x) + 0.1*randn()