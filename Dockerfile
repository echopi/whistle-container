FROM node:carbon

USER node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
ENV NODE_ENV=production

RUN npm i -g whistle

WORKDIR /home/node

EXPOSE 8899

CMD ["w2", "run"]
