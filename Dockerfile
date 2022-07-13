FROM node:15.12.0

WORKDIR /app

COPY package.json ./

RUN npm install -g vite

COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ADD . .

RUN npm install

ENTRYPOINT ["/entrypoint.sh"]

CMD ["npm", "run", "dev"]