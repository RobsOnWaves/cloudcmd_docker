FROM node:lts-buster-slim

RUN  npm i cloudcmd -g; mkdir /data

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
