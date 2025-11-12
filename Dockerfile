FROM docker:latest
COPY start-redis.sh /start-redis.sh
RUN chmod +x /start-redis.sh
ENTRYPOINT ["/start-redis.sh"]
