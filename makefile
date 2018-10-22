
INC_DIR = ./include
SRC_DIR = ./src
OBJ_DIR = ./obj
BIN_DIR = ./bin

UTILS_SRC = $(wildcard ${SRC_DIR}/utils/*.cpp)  
UTILS_OBJ = $(patsubst %.cpp,${OBJ_DIR}/%.o,$(notdir ${UTILS_SRC})) 

HDRNET_SRC = $(wildcard ${SRC_DIR}/hdrnet/*.cpp)  
HDRNET_OBJ = $(patsubst %.cpp,${OBJ_DIR}/%.o,$(notdir ${HDRNET_SRC})) 


TARGET = main
BIN_TARGET = ${BIN_DIR}/${TARGET}
BIN_OBJECT = $(OBJ_DIR)/${TARGET}.o
BIN_FILE = $(BIN_DIR)/${TARGET}.cpp


CC = g++
CFLAGS = -std=c++11 -g -Wall -I${INC_DIR} -DDEBUG

# build main
${BIN_TARGET}: $(BIN_OBJECT) $(UTILS_OBJ) $(HDRNET_OBJ)
	$(CC) $(BIN_OBJECT) $(UTILS_OBJ) $(HDRNET_OBJ) -o $@

# build main.o
$(BIN_OBJECT): $(BIN_FILE)
	$(CC) $(CFLAGS) -c $(BIN_FILE) -o $(BIN_OBJECT)

# build 
${OBJ_DIR}/%.o:${SRC_DIR}/hdrnet/%.cpp
	$(CC) $(CFLAGS) -c  $< -o $@

${OBJ_DIR}/%.o:${SRC_DIR}/utils/%.cpp
	$(CC) $(CFLAGS) -c  $< -o $@

run: $(BIN_TARGET)
	$(BIN_TARGET)


.PHONY:clean
clean:
	-rm $(OBJ_DIR)/*
	-rm $(BIN_OBJECT)
	-rm $(BIN_TARGET)
	-rm *.rgb
	-rm *.rgb.jpg
