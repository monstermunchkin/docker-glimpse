FROM debian:jessie
MAINTAINER Thomas Hipp <thomashipp@gmail.com>

RUN echo "deb http://distributor.measure-it.net/packages/ debian-jessie/" > /etc/apt/sources.list.d/glimpse.list && \
		apt-get update && \
		apt-get install -y --force-yes ca-certificates glimpse-console && \
		apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/apt/sources.list.d/glimpse.list

VOLUME ["/var/lib/glimpse"]

USER glimpse

ENTRYPOINT ["/usr/bin/glimpse-console"]
