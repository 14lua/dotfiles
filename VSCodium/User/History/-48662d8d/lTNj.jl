using Plots
using LaTeXStrings

x = 10 .^ range(0, 4, length=100)
y = @. 1/(1+x)

plot(x, y, label=L"\frac{1}{1+x}")
plot!(xscale=:log10, yscale=:log10, minorgrid=true)
xlims!(1e+0, 1e+4)
ylims!(1e-5, 1e+0)
title!(L"Log-log plot of $\frac{1}{1+x}$")
xlabel!("x")
ylabel!("y")