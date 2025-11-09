# Here is a Raku (Perl 6) script example for a discrete logistic 
# growth model matching the form:

# $$
# p_{t+1} = p_t + r p_t \left(1 - \frac{p_t}{m}\right)
# $$

# where:
# - $$p_t$$ is the population at time $$t$$,
# - $$r$$ is the growth rate,
# - $$m$$ is the carrying capacity.

# This example demonstrates the population update step for small populations in a logistic growth scenario, written in Raku as `logistic.pm6`:

# ```raku
unit module Logistic;


# Discrete logistic growth step function
sub logistic_step($pt, $r, $m) {
    return $pt + $r * $pt * (1 - $pt / $m);
}

# Simulate logistic growth for T steps from initial population p0
sub simulate_logistic($p0, $r, $m, $T) {
    my @populations = $p0;
    for 1..$T -> $t {
        my $pt = @populations[$t - 1];
        my $pt1 = logistic_step($pt, $r, $m);
        @populations.push($pt1);
    }
    return @populations;
}

# Example usage:
my $initial_population = 0.1;   # small initial population
my $growth_rate = 0.5;          # growth rate r
my $carrying_capacity = 10;     # carrying capacity m
my $time_steps = 30;            # number of iterations

my @results = simulate_logistic($initial_population, $growth_rate, $carrying_capacity, $time_steps);

for @results.kv -> $i, $pop {
    say "Time $i: Population = {$pop.fmt('%.4f')}";
}
# ```

# This code:
# - Defines a `logistic_step` function implementing the logistic update formula $$p_{t+1}$$.
# - Implements `simulate_logistic` to run the iteration for $$T$$ time steps starting from an initial value.
# - Prints the population at each time step formatted to 4 decimals.
# - Uses a small initial population to highlight the dynamics of growth under the logistic model.

# Save this as `logistic.pm6` and run it with a Raku interpreter.

# This matches the classical discrete logistic model you indicated and is suitable for studying population growth effects on small populations.[1][3][8]

# [1](https://math.libretexts.org/Bookshelves/Calculus/Calculus_(OpenStax)/08:_Introduction_to_Differential_Equations/8.04:_The_Logistic_Equation)
# [2](https://www.youtube.com/watch?v=JgMvB22XQs0)
# [3](https://proceedings.sbmac.org.br/sbmac/article/download/3884/3934/7782)
# [4](https://bibliotekanauki.pl/articles/908165.pdf)
# [5](https://pmc.ncbi.nlm.nih.gov/articles/PMC7053935/)
# [6](https://www.sciencedirect.com/science/article/abs/pii/S0304380013002111)
# [7](https://gi.ics.nara-wu.ac.jp/~takasu/lecture/graduate_course/L9_logistic-growth.pdf)
# [8](https://www.khanacademy.org/science/ap-biology/ecology-ap/population-ecology-ap/a/exponential-logistic-growth)