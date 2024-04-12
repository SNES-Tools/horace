# Functions

Functions only have scope over the parameters and any local variables declared.
It is not able to see other functions or state (and thus cannot call other
functions or read/write state).

# State

Each state declaration is evaluated within the empty context (which would
enforce that every initializer can be statically determined).

# Note

Together, these rules are complicated, not very intuitive, poorly documented,
and likely error prone for everybody. Sorry.
