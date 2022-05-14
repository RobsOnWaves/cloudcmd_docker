FROM node:lts-buster-slim

RUN  npm i cloudcmd -g

CMD [ "cloudcmd" ]
