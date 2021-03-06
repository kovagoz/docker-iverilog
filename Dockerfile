FROM alpine:3

RUN set -x && \
	apk add libgcc libstdc++ --no-cache && \

	apk add --no-cache --virtual build-deps \
		git autoconf build-base gperf flex-dev bison && \

	git clone --depth 1 https://github.com/steveicarus/iverilog.git /tmp/iverilog && \
	cd /tmp/iverilog && \
	autoconf && \
	./configure && \
	make && \
	make install && \

	apk del --purge build-deps && \
	rm -rf /tmp/*

ENTRYPOINT ["/usr/local/bin/iverilog"]

# vim: ts=4
