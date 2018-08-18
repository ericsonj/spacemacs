ENTITIES := __PROJECT-NAME__.vhd
TESTBENCH_ENTITY := __PROJECT-NAME___tb
CONFIG_GTKW := $(wildcard *.gtkw)

TESTBENCH_OUT := `echo $(TESTBENCH_ENTITY) | tr A-Z a-z`
STOP_TIME=1us

all: $(TESTBENCH_ENTITY)

$(TESTBENCH_ENTITY): $(TESTBENCH_ENTITY).vhd
	ghdl -s $(ENTITIES) $(TESTBENCH_ENTITY).vhd
	ghdl -a $(ENTITIES) $(TESTBENCH_ENTITY).vhd
	ghdl -e $(TESTBENCH_ENTITY)
	ghdl -r $(TESTBENCH_ENTITY) --stop-time=$(STOP_TIME) --vcd=$(TESTBENCH_ENTITY).vcd

sim: $(TESTBENCH_ENTITY)
	gtkwave $(TESTBENCH_ENTITY).vcd $(CONFIG_GTKW)

clean:
	rm -r $(TESTBENCH_OUT)
	rm -r *.o *.vcd *.cf
