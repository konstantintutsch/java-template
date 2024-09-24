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

.PHONY: doc clean run

#
# Build
#

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/$(EXECUTABLE): $(BUILDDIR) $(SOURCES)
	$(JC) $(JCFLAGS) $(SOURCES)
	$(JR) cfe $@ $(PACKAGE).Main -C $(BUILDDIR) $(NAMESPACE)

#
# Utilities
#

doc: $(BUILDDIR) $(SOURCES)
	LANG=en_US javadoc -d $(BUILDDIR)/doc $(SOURCES)

run: $(BUILDDIR)/$(EXECUTABLE)
	$(JV) -jar $^

clean: $(BUILDDIR)
	rm -r $^
