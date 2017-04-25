# docker build [--build-arg <key>=<val>]
FROM node:alpine

RUN apk update && apk add bash
WORKDIR /app
RUN npm install elasticdump
ENV PATH=node_modules/.bin:$PATH
COPY ["entrypoint.sh", "/app"]
ENTRYPOINT ["/app/entrypoint.sh"]
