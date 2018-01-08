FROM node:alpine
RUN apk update && apk add bash

COPY . .
ARG ACTIVE_ENV
RUN echo $ACTIVE_ENV
ENV ACTIVE_ENV=$ACTIVE_ENV
#ADD direct_manifest.sh /root/direct_manifest.sh
RUN chmod +x direct_manifest.sh
RUN cat /src/.well-known/smart/manifest.json
CMD ["./direct_manifest.sh"]
RUN cat /src/.well-known/smart/manifest.json
RUN npm install
CMD [ "npm", "run", "serve" ]