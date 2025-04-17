using Plots

gr()

x = -10:0.1:10

anim = @animate for t in 1:100
    y = (x .+ t / 10).^2
    plot(x, y, label="y = (x + $(t/10))^2", ylim=(-10, 100), title="Animating y = x^2")
end

gif(anim, "parabola-animation.gif", fps=15)