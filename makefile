SPINSRC=./src
SPIN=./spin
CODE=rwlock.pml
OUT=rwlock

all:
	$(SPIN) -a $(CODE)
	gcc pan.c -o ./$(OUT)

spinmake:
	$(MAKE) -C $(SPINSRC)
	cp $(SPINSRC)/spin $(SPIN)

run:
	-rm *.trail
	./$(OUT)
trace:
	$(SPIN) -t -p ./$(CODE)

clean:
	rm *.trail $(OUT)
	$(MAKE) -C $(SPINSRC) clean
