# add the seeding to the mongodb image
FROM mongo:latest
WORKDIR /data
COPY seed.js /docker-entrypoint-initdb.d/
EXPOSE 27017
CMD ["mongod"]