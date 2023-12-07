NAME=cpm
ORIGIN=0E000h

.PHONY: all clean

all: $(NAME).bin

$(NAME).bin: $(NAME).p
	p2bin $< $@

$(NAME).p: ccp.p bdos.p
	pbind $^ $@

ccp.p: ccp.asm
	asl -D origin=$(ORIGIN) $<

bdos.p: bdos.asm
	asl -D origin=$(ORIGIN)+800h $<

clean:
	rm $(NAME).bin *.p
