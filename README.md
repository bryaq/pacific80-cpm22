# BUILD

You'll need

- [Macro Assembler AS](http://john.ccac.rwth-aachen.de:8000/as/)
- [ZMAC assembler](http://48k.ca/zmac.html)
- `make`, `srecored` from your distribution's package repository

# INSTALL

Put `cpm.bin` at the very beginning of a CP/M partition or it's image file.
```
dd if=cpm.bin of=disk.img conv=notrunc
```

# USE

See `CCP80NEW.DOC` and comments in `CCP8080.ASM`.