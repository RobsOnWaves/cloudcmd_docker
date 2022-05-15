FROM node:lts-buster-slim

RUN  npm i cloudcmd -g;

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
