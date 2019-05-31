# ASS01 Example Makefile
#
# This makefile is intended for use with GNU make
# This example is intended to be built with Linaro bare-metal GCC

TARGET=fact01.axf

CC=aarch64-elf-gcc
LD=aarch64-elf-gcc

# Select build rules based on Windows or Unix
ifdef WINDIR
DONE=@if exist $(1) echo Build completed.
RM=if exist $(1) del /q $(1)
SHELL=$(WINDIR)\system32\cmd.exe
else
ifdef windir
DONE=@if exist $(1) echo Build completed.
RM=if exist $(1) del /q $(1)
SHELL=$(windir)\system32\cmd.exe
else
DONE=@if [ -f $(1) ]; then echo Build completed.; fi
RM=rm -f $(1)
endif
endif

all: $(TARGET)
	$(call DONE,$(TARGET))
	
rebuild: clean all

clean:
	$(call RM,*.o)
	$(call RM,$(TARGET))

main.o: main.c
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@

addnode.o: addnode.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@
	
deletenode.o: deletenode.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@

pushstack.o: pushstack.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@
	
popstack.o: popstack.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@

gettop.o: gettop.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@

getlength.o: getlength.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@
	
bstinsert.o: bstinsert.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@

bstfind.o: bstfind.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@

bstfindmin.o: bstfindmin.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@

bstfindmax.o: bstfindmax.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@
		
hashinsert.o: hashinsert.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@
	
hashdelete.o: hashdelete.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@
	
hashfind.o: hashfind.S
# Compile for best debug view (lowest optimization)
	$(CC) -c -march=armv8-a -g -O0 $^ -o $@
	
$(TARGET): main.o addnode.o deletenode.o pushstack.o popstack.o gettop.o getlength.o bstinsert.o bstfind.o bstfindmin.o bstfindmax.o hashinsert.o hashdelete.o hashfind.o 
# Link with specific base address to suit VE model memory layout
	$(LD) --specs=aem-ve.specs -Wl,--build-id=none main.o addnode.o deletenode.o pushstack.o popstack.o gettop.o getlength.o bstinsert.o bstfind.o bstfindmin.o bstfindmax.o hashinsert.o hashdelete.o hashfind.o -o $@
