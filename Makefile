#
# Package
#
NAMESPACE := com
PACKAGE := $(NAMESPACE).konstantintutsch.Template

#
# Compilers
#
JC := javac
JR := jar

#
# Files
#
SOURCES := $(wildcard *.java)
BUILDDIR := build
EXECUTABLE := Build.jar

#
# Targets not producing output files
#
.PHONY: clean run

#
# Build
#
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/$(EXECUTABLE): $(BUILDDIR)
	javac -d $(BUILDDIR) $(SOURCES)
	jar cfe $(BUILDDIR)/$(EXECUTABLE) $(PACKAGE).Main -C $(BUILDDIR) $(NAMESPACE)

#
# Utilities
#
run: $(BUILDDIR)/$(EXECUTABLE)
	java -jar $(BUILDDIR)/$(EXECUTABLE)

clean:
	rm -r $(BUILDDIR)
