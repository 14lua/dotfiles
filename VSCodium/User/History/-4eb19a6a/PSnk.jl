using Plots
using LinearAlgebra

# Constants
G = 6.67430e-11  # Gravitational constant (m^3 kg^-1 s^-2)
m1 = 5.972e24    # Mass of body 1 (e.g., Earth) in kg
m2 = 7.348e22    # Mass of body 2 (e.g., Moon) in kg
r1 = [0.0, 0.0]  # Initial position of body 1 (x, y)
r2 = [3.844e8, 0.0]  # Initial position of body 2 (x, y) (distance to Moon)
v1 = [0.0, 0.0]  # Initial velocity of body 1
v2 = [0.0, 1.022e3]  # Initial velocity of body 2 (tangential velocity)

# Time parameters
dt = 60.0  # Time step in seconds
t_max = 60 * 60 * 24 * 30  # Total time for simulation (30 days)
num_steps = Int(t_max / dt)

# Arrays to store positions
positions1 = zeros(num_steps, 2)
positions2 = zeros(num_steps, 2)

# Initial positions
positions1[1, :] = r1
positions2[1, :] = r2

# Simulation loop
for i in 1:num_steps-1
    # Calculate the distance vector and magnitude
    r = positions2[i, :] - positions1[i, :]
    distance = norm(r)
    
    # Calculate gravitational force
    force = G * m1 * m2 / distance^2
    force_vector = force * (r / distance)  # Direction of the force
    
    # Update velocities (Newton's second law)
    v1 += force_vector / m1 * dt
    v2 -= force_vector / m2 * dt
    
    # Update positions
    positions1[i+1, :] = positions1[i, :] + v1 * dt
    positions2[i+1, :] = positions2[i, :] + v2 * dt
end

# Create an animation
anim = @animate for i in 1:num_steps
    plot(positions1[1:i, 1], positions1[1:i, 2], label="Body 1 (m1)", color=:blue, legend=:topright, aspect_ratio=:equal, xlims=(-4e8, 4e8), ylims=(-4e8, 4e8))
    plot!(positions2[1:i, 1], positions2[1:i, 2], label="Body 2 (m2)", color=:orange)
    scatter!([positions1[i, 1]], [positions1[i, 2]], color=:blue, marker=:circle, markersize=5)
    scatter!([positions2[i, 1]], [positions2[i, 2]], color=:orange, marker=:circle, markersize=5)
    title!("2-Body Keplerian Orbit Simulation")
end

# Save the animation as a gif
gif(anim, "keplerian_orbit.gif", fps=30)
