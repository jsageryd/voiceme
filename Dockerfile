FROM alpine
RUN apk add sed sic
COPY bot.sh /
ENTRYPOINT /bot.sh
