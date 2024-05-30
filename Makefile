
COMPILER=iverilog
SRC=add_4.v
SRC+=add_4_tb.v
OBJ=add_4
WAVE=add_4_wave.vcd


compile:
	$(COMPILER) $(SRC) -o $(OBJ) 


all:
	$(COMPILER) $(SRC) -o $(OBJ) 
	vvp $(OBJ)
	gtkwave $(WAVE)


view:
	gtkwave $(WAVE)


clean:
	rm *.vcd add_4

