FROM alpine:3

RUN set -x && \
	apk add --no-cache --virtual build-deps \
		git autoconf build-base gperf flex-dev bison && \

	git clone --depth 1 https://github.com/ddm/verilator.git /tmp/verilator && \
	cd /tmp/verilator && \
	autoconf && \
	./configure && \
	make && \
	make install && \

	apk del --purge build-deps && \
	rm -rf /tmp/*

ENTRYPOINT iverilog

# vim: ts=4
