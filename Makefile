.PHONY: all
all: clean
	mkdir -p build
	cd src; zip -r ../build/fablesfantasyrp.zip ./

.PHONY: clean
clean:
	rm -rf build

.PHONY: install
install: all
	cp build/fablesfantasyrp.zip ~/.minecraft/resourcepacks/

.PHONY: watch
watch:
	while true; do \
		make install; \
		inotifywait -qr -e close_write -e modify -e attrib -e move -e create -e delete src; \
		done

.PHONY: fixlinefeeds
fixlinefeeds:
	echo "WARNING: This will reset all uncommitted changes in your working directory! Press CTRL+C to abort, or press enter to confirm."; read
	git rm --cached -r .
	git reset --hard
