FROM docker:18.06-dind
COPY rootfs/ /
RUN apk --no-cache add python==2.7.15-r1 py-pip==10.0.1-r0 groff==1.22.3-r2 less==530-r0 mailcap==2.1.48-r0
RUN pip install --upgrade awscli==1.16.88 python-magic==0.4.15
RUN apk --purge del py-pip && rm -rf /var/cache/apk/*