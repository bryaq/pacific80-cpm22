NAME=cpm
ORIGIN=0xE000

.PHONY: all clean

all: $(NAME).bin

$(NAME).bin: $(NAME).hex
	srec_cat -o $@ -binary $< -intel -offset -$(ORIGIN)

$(NAME).hex: ccp.hex bdos.hex
	srec_cat -o $@ -intel -address-length=2 -output_block_packing ccp.hex -intel bdos.hex -intel

ccp.hex: CCP8080.ASM
	zmac -8 --dri -o $@ $<

bdos.hex: bdos.p
	p2hex $<

ccp.p: ccp.asm
	asl -D origin=$(ORIGIN) $<

bdos.p: bdos.asm
	asl -D origin=$(ORIGIN)+800h $<

clean:
	rm -rf $(NAME).bin *.p *.hex *.lst
