# This is a template makefile to compile the main implementation file and link
#     it with all other object files
#
# This should be in the same directory as your driver (main)
#
# Examples of each variable are given as comments on the same line as the
#     variable's declaration


# --- Variable Declarations ---

# Need to change these four

# compiler
CC := #gcc
# compiler flags
TEMPLATE_CFLAGS := #-std=c++11
# linker flags
TEMPLATE_LFLAGS := #-lm
# executable
EXEC := #a.out

# Main target
# Meant to compile the entire project
# Rule for compiling $(EXEC) is found below
# No need to change
compile: $(EXEC)
	@echo "- - - - Project compiled - - - -"
	@echo "Executable: $(EXEC)"

# The directory in which this makefile resides
# No need to change
TEMPLATE_PATH := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

# This is where the object files will be stored so your work doesn't
#     get cluttered with *.o files
# No need to change
_TEMPLATE_OBJDIR := .ObjectFiles/
TEMPLATE_OBJDIR := $(TEMPLATE_PATH)$(_TEMPLATE_OBJDIR)

# Files on which the main implementation file depends
#     So anything #included in the driver
# Need to change
_TEMPLATE_DEPS := #src/SubModule.hpp
TEMPLATE_DEPS := $(foreach OBJ,$(_TEMPLATE_DEPS),$(TEMPLATE_PATH)$(OBJ))

# Driver object file, just the name of the file and .o
# Example given is for a driver named main.cpp
# Need to change
_TEMPLATE_MAIN_OBJ := #main.o
TEMPLATE_MAIN_OBJ := $(TEMPLATE_OBJDIR)$(_TEMPLATE_MAIN_OBJ)

# --- Sub makefile inclusions ---

# Any makefiles that need to be included should go here
# Need to change
include #$(TEMPLATE_PATH)src/SubModule.mk

# --- Rules ---

# Target for executable
# Need to change only after '#' on V this line V
$(EXEC): $(TEMPLATE_MAIN_OBJ) #$(SUBMODULE_MAIN_OBJ)
	$(CC) $(TEMPLATE_CFLAGS) $^ -o $@ $(TEMPLATE_LFLAGS)

# Compile implementation file
# No need to change
$(TEMPLATE_OBJDIR)%.o: $(TEMPLATE_PATH)%.cpp $(TEMPLATE_DEPS)
	$(CC) -c $(TEMPLATE_CFLAGS) $< -o $@

# Object Directory Creation
# This creates the object directory for Template and the directory for other
#     SubModules
# Need to change only after '#' on V this line V and the 'echo' statement after
TemplateObjectDirectory: #SubModuleObjectDirectory
	mkdir -p $(TEMPLATE_OBJDIR)
	@echo "- - - - Template ObjectFile directory created - - - -"

# Clean
# Removes all object directories from Template and other SubModules
# Need to change only after '#' on V this line V
TemplateClean: #SubModuleClean
	rm -f $(TEMPLATE_MAIN_OBJ) $(EXEC)
