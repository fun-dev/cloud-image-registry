FROM registry:2
RUN mkdir /auth /certs
# TLS対応
COPY ./certs/ /certs/
ENV REGISTRY_HTTP_ADDR=0.0.0.0:443
ENV REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt
ENV REGISTRY_HTTP_TLS_KEY=/certs/domain.key
# ユーザ認証追加
COPY ./auth/htpasswd /auth/htpasswd
ENV REGISTRY_AUTH=htpasswd
ENV REGISTRY_AUTH_HTPASSWD_REALM="Registry Realm"
ENV REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd