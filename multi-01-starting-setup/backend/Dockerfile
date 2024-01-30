FROM node

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

EXPOSE 80

# will get overriden by environment variable on command line
ENV MONGODB_USERNAME=default
ENV MONGODB_PASSWORD=secret

CMD ["npm", "start"]
