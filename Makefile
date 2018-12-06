.PHONY: all clean test

all:
	@echo Please use one of the make targets specified in the handout.

test: test_exe
	./$<

test_exe: Sources/game_controller.v Sources/GARO.v Sources/led_controller.v Sources/main.v Sources/register.v
	iverilog -o $@ -Wall $^

clean:
	rm -f *_exe *.vcd