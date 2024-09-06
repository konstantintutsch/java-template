#
# Package
#

NAMESPACE := com
PACKAGE := $(NAMESPACE).konstantintutsch.Template

#
# Files
#

SOURCES := $(wildcard *.java)

BUILDDIR := build
EXECUTABLE := Build.jar

#
# Compilers
#

JC := javac
JCFLAGS := -d $(BUILDDIR)

JR := jar
JV := java

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
	$(JC) $(JCFLAGS) $(SOURCES)
	$(JR) cfe $(BUILDDIR)/$(EXECUTABLE) $(PACKAGE).Main -C $(BUILDDIR) $(NAMESPACE)

#
# Utilities
#

run: $(BUILDDIR)/$(EXECUTABLE)
	$(JV) -jar $(BUILDDIR)/$(EXECUTABLE)

clean:
	rm -r $(BUILDDIR)
