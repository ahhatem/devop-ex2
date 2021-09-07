FROM node:12.18.3-alpine3.12
RUN apk update
RUN apk add bash
RUN apk add curl
WORKDIR /app
COPY ./devops-exercises .
COPY ./Start.sh .
EXPOSE 5000
RUN chmod +x /app/Start.sh
CMD [ "/app/Start.sh" ]
