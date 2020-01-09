# Build: docker build -t <username>/node .

# Option 1
# Start MongoDB and Node (link Node to MongoDB container with legacy linking)
 
# docker run -d --name my-mongodb mongo
# docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp <username>/node

# Option 2: Create a custom bridge network and add containers into it

# docker network create --driver bridge isolated_network
# docker run -d --net=isolated_network --name mongodb mongo
# docker run -d --net=isolated_network --name nodeapp -p 3000:3000 <username>/node

# Seed the database with sample database
# Run: docker exec nodeapp node dbSeeder.js

FROM node:latest

LABEL author="Anthony Vest"

ENV NODE_ENV=development 
ENV PORT=3000

COPY      . /src/www
WORKDIR   /src/www

RUN  npm install && npm cache clean --force

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]