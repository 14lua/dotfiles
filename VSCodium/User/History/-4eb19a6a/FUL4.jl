using Plots

x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)
plot(x, [y1 y2], title="Trigonometric functions", label=["sin(x)" "cos(x)"], linewidth=3)