FROM flnpw/ca-certificates AS certs

FROM busybox
COPY --from=certs /etc/ssl /etc/ssl

ARG VERSION_TAG=0.12.24
ARG ARTIFACT=terraform_${VERSION_TAG}_linux_amd64.zip
ENV URL=https://releases.hashicorp.com/terraform/$VERSION_TAG/$ARTIFACT
ENV BINARY=terraform

ADD $URL /tmp/$ARTIFACT
RUN set -exuo pipefail; \
  mkdir -p /usr/local/bin \
  && unzip /tmp/$ARTIFACT -d /usr/local/bin/ \
  && rm -rf /tmp/$ARTIFACT \
  && chmod 755 /usr/local/bin/$BINARY

ENTRYPOINT ["terraform"]
CMD ["--help"]
