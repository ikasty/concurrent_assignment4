SPINSRC=./src
SPIN=./spin
CODE=rwlock.pml
OUT=rwlock

all: spinmake
	$(SPIN) -a $(CODE)
	gcc pan.c -o ./$(OUT)

spinmake:
	$(MAKE) -C $(SPINSRC)
	cp $(SPINSRC)/spin $(SPIN)

run:
	./$(OUT)
trace:
	$(SPIN) -t -p ./$(CODE)

clean:
	rm $(SPIN)
	$(MAKE) -C $(SPINSRC) clean
