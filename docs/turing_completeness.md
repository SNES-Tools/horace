This language is *not* Turing complete. Technically, no language is, but even
if it was, it is arguably worse because we lose a number of assertions we can
make about the language.

For example, we could prove that every iteration of the main loop will halt
(thus implying it is not a Turing machine). This then allows us to assert
finite bounds on the memory usage and run time of programs in a way that allows
the compiler to more heavily optimize the code.
