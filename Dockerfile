FROM docker:latest@sha256:a6dd5322747a95cd8e3207bd8d415a8fd20ec34e9c00f06dc019cbd912013489
COPY start-redis.sh /start-redis.sh
RUN chmod +x /start-redis.sh
ENTRYPOINT ["/start-redis.sh"]
