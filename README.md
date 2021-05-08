# [Icarus Verilog](http://iverilog.icarus.com) in a Docker container

Icarus Verilog is a Verilog simulation and synthesis tool.
It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format.

## Usage

Compile your Verilog code to VVP:

```sh
docker run --rm -it -v $(PWD):/host -w /host kovagoz/iverilog hello_tb.v
```

If the command has run successfully then you have an `a.out` file.

Now execute this file to perform the simulation:

```sh
docker run --rm -it -v $(PWD):/host -w /host --entrypoint vvp kovagoz/iverilog a.out
```
