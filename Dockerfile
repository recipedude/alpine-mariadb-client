FROM alpine:3.8
LABEL maintainer "Sean Wenzel <sean@infinitenetworks.com>"

RUN apk -v --update add --no-cache \
			python \
			py-pip \
			groff \
			less \
			mailcap \
			mariadb-client \
			pwgen \
			bzip2 \
			&& \
			pip install --upgrade pip && \
			pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
			apk -v --purge del py-pip && \
    	rm -f /var/cache/apk/* 

ADD files/run.sh /scripts/run.sh
RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts && \
    mkdir /data

VOLUME /data
VOLUME /root/.aws

ENTRYPOINT ["/scripts/run.sh"]
