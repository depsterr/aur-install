PREFIX?=/usr
BINDIR?=$(PREFIX)/bin

all:
	@echo "Usage: make install or make uninstall"

install:
	install -Dm755 aur-install $(BINDIR)/aur-install

uninstall:
	rm -f $(BINDIR)/aur-install
