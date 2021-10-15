# Fri Sep 17 11:30:20 PDT 2021
#
# The grid SIR model that I explained in class.

# Probably we want to start with visuals so we can see what's going on.
# 0 - susceptible
# 1 - infected
# 2 - removed

# Do a single time iteration of the model.
iterate = function(x, p)
{
    xnew = x
    infected = x == 1L
    infected_indices = which(infected, arr.ind = TRUE)

    for(i in seq(nrow(infected_indices))){
        xnew = infect(infected_indices[i, 1], infected_indices[i, 2], xnew, p)
    }

    # Those who were infected are now removed
    xnew[infected] = 2L
    xnew
}

infect_one = function(p)
    sample(c(TRUE, FALSE), prob = c(p, 1-p))

# infect susceptible neighbors and return x
infect = function(row, col, x, p)
{
    firstrow = max(1L, row - 1L)
    lastrow = min(nrow(x), row + 1L)
    firstcol = max(1L, col - 1L)
    lastcol = min(ncol(x), col + 1L)

    for(i in firstrow:lastrow){
        for(j in firstcol:lastcol){
            # Susceptible and gets it
            if(x[i, j] == 0L && infect_one(p)){
                x[i, j] = 1L
            }
        }
    }
    x
}

plot_sir = function(x, sir_colors = c("white", "red", "grey"), ...)
{
    # My color palette encoding:
    # 0 white   susceptible
    # 1 red     infected
    # 2 grey removed
    image(t(x), col = sir_colors, xaxt = "n", yaxt = "n", ...)
}


initial_infect = function(nrow, ncol, p0)
{
    x = matrix(0L, nrow = nrow, ncol = ncol)
    popsize = length(x)
    initial_infect = sample(popsize, size = round(p0*popsize))
    x[initial_infect] = 1L
    x
}


# p is probability of infection
# p0 is initial probability of infection
sir0 = function(nrow = 40, ncol = 50, p = 0.2, p0 = 0.01, plot = FALSE, time_per_frame = 0.2, ...)
{
    x = initial_infect(nrow, ncol, p0)
    time = 0L
    while(any(x == 1L)){
        x = iterate(x, p)
        time = time + 1L
        if(plot){
            plot_sir(x)
            Sys.sleep(time_per_frame)
        }
    }
    list(x = x, time = time)
}


# Goal:
# Modify sir()
# so that it accepts x, and defaults to initial_infection.

# p is probability of infection
# p0 is initial probability of infection
sir = function(x = initial_infect(nrow, ncol, p0),
    nrow = 40, ncol = 50, p = 0.2, p0 = 0.01, plot = FALSE, time_per_frame = 0.2, ...)
{
    time = 0L
    while(any(x == 1L)){
        x = iterate(x, p)
        time = time + 1L
        if(plot){
            plot_sir(x)
            Sys.sleep(time_per_frame)
        }
    }
    list(x = x, time = time)
}


if(FALSE)
{

    sir(plot = TRUE)

    x = matrix(0L, nrow = 20, ncol = 30)
    # Infected cells in the center
    x[10:11, 15:16] = 1L

    # Watching ONE event unfold.
    sir(x, plot = TRUE, p = 0.25)

    # Let's summarize n events
    n = 100
    sims = replicate(n, sir(x, plot = FALSE, p = 0.25), simplify = FALSE)

    xall = lapply(sims, `[[`, "x")
    xtotal = Reduce(`+`, xall, init = 0)

    image(t(xtotal))

}
