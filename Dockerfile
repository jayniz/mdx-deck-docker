FROM node:12

ARG MDX_DECK_VERSION

WORKDIR /home/node/mdx-deck
RUN chown node:node /home/node/mdx-deck

USER node
COPY ./etc/package.json .
RUN bash -c "sed -i 's/MDX_DECK_VERSION/$MDX_DECK_VERSION/g' package.json"
RUN npm install

CMD npm start
