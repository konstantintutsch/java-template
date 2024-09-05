SOURCES := $(wildcard *.java)
BUILDDIR := build

JARCLS := $(SOURCES:%.java=-C $(BUILDDIR) %.class)
EXECUTABLE := Build.jar

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/$(EXECUTABLE): $(BUILDDIR)
	javac -d $(BUILDDIR) $(SOURCES)
	jar cfe $(BUILDDIR)/$(EXECUTABLE) Main $(JARCLS)

run: $(BUILDDIR)/$(EXECUTABLE)
	java -jar $(BUILDDIR)/$(EXECUTABLE)

clean:
	rm -r $(BUILDDIR)
