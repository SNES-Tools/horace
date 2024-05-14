# horace
Horace programming language

## How to run a program

One needs `cabal` to run programs. There are three sample programs/games in the
`ex` directory:
* `pong.txt`
* `cursor.txt`
* `ball.txt`

To compile these programs, run from the root project directory
```
cabal run horace -- ex/XXX.txt
```
where `XXX` is your program in the `ex` directory.

The compiled program will be `asm/prog.sfc` which you can run in your favorite
SNES emulator.
