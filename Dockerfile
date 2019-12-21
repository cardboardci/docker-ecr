FROM cardboardci/ci-core:focal
USER root

ARG DEBIAN_FRONTEND=noninteractive

COPY rootfs/ /
RUN apk --no-cache add python2==2.7.16-r1 py2-pip==18.1-r0 groff==1.22.3-r2 less==530-r0 mailcap==2.1.48-r0
RUN pip install --upgrade awscli==1.16.88 python-magic==0.4.15
RUN apk --purge del py-pip && rm -rf /var/cache/apk/*

USER cardboardci

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="ecr"
LABEL org.label-schema.version="${version}"
LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.release="CardboardCI version:${version} build-date:${build_date}"
LABEL org.label-schema.vendor="cardboardci"
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.summary="AWS ECR"
LABEL org.label-schema.description="A unified tool to deploy Docker images to Amazon Elastic Container Registry (ECR)"
LABEL org.label-schema.url="https://gitlab.com/cardboardci/images/ecr"
LABEL org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/ecr/releases"
LABEL org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/ecr"
LABEL org.label-schema.distribution-scope="public"
LABEL org.label-schema.vcs-type="git"
LABEL org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/ecr"
LABEL org.label-schema.vcs-ref="${vcs_ref}"