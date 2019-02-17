# Easy way to start editing this in vim
# :%s/TEMPLATE/SUBMODULENAME/g
# :%s/Template/SubmoduleName/g

TEMPLATE_PATH := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

include $(TEMPLATE_PATH)path/to/Other.mk

# --- Definitions ---

# This object does not correspond to an implementation file,
#     especially not a file with `main` in it
# This object will be TEMPLATE_SUB_OBJS and all OTHER_MAIN_OBJs
#     linked together
# No need to change
TEMPLATE_MAIN_OBJ := $(TEMPLATE_PATH)Template.o

# Flags for compiling and linking
# Need to Change all of these
TEMPLATE_CFLAGS := #-std=c++17 -O3
TEMPLATE_LFLAGS := #-lm

# This is where the TEMPLATE_SUB_OBJS will be stored so your work doesn't
#     get cluttered with *.o files
# No need to change
_TEMPLATE_OBJDIR := .ObjectFiles/
TEMPLATE_OBJDIR := $(TEMPLATE_PATH)$(_TEMPLATE_OBJDIR)

# Files on which all the implementation files depend
# Need to change only after '#' on V this line V
_TEMPLATE_DEPS := #Template.hpp path/to/Other.hpp
TEMPLATE_DEPS := $(foreach OBJ,$(_TEMPLATE_DEPS),$(TEMPLATE_PATH)$(OBJ))

# All implementation files to be compiled for the TEMPLATE_MAIN_OBJ
# Need to change all these lines, does not include other MAIN_OBJ files
_TEMPLATE_SUB_OBJS := \
	src/ImplementationFile.o \
	src/AnotherImpFile.o \
	lib/CompileThisOne.o \
	lib/inc/ThisOneToo.o
TEMPLATE_SUB_OBJS := $(foreach OBJ,$(_TEMPLATE_SUB_OBJS),$(TEMPLATE_OBJDIR)$(OBJ))

# --- Rules ---

# Main object
# Links object files into one object file (TEMPLATE_MAIN_OBJ)
# Need to change only after '#' on V this line V and the 'echo' statement after
$(TEMPLATE_MAIN_OBJ): #$(TEMPLATE_SUB_OBJS) $(OTHER_MAIN_OBJ)
	@echo "- - - - Template compiled - - - -"
	$(LD) -r $(TEMPLATE_LFLAGS) $^ -o $@
	@echo "- - - - Template linked - - - -"

# Sub objects
# Compile implementation file
# No need to change
$(TEMPLATE_OBJDIR)%.o: $(TEMPLATE_PATH)%.cpp $(TEMPLATE_DEPS)
	$(CC) -c $(TEMPLATE_CFLAGS) $< -o $@

# Object Directory Creation
# This creates the object directory for Template and the directory for Other
# Need to change all these lines
TemplateObjectDirectory: #OtherObjectDirectory
	mkdir -p $(TEMPLATE_OBJDIR)
	mkdir -p $(TEMPLATE_OBJDIR)src/
	mkdir -p $(TEMPLATE_OBJDIR)lib/
	mkdir -p $(TEMPLATE_OBJDIR)lib/inc/
	@echo "- - - - Template ObjectFile directory created - - - -"

# Clean
# Removes all object directories from Template and Other
# Need to change only after '#' on V this line V
TemplateClean: #OtherClean
	rm -f $(TEMPLATE_SUB_OBJS) $(TEMPLATE_MAIN_OBJ)
