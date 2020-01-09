# Build: docker build -t <username>/mongo-node .

# Option 1
# Start MongoDB and Node (link Node to MongoDB container with legacy linking)
 
# docker run -d --name my-mongodb mongo
# docker run -d -p 8080:3000 --link my-mongodb:mongodb --name nodeapp <username>/mongo-node

# Option 2: Create a custom bridge network and add containers into it

# docker network create --driver bridge isolated_network
# docker run -d --net=isolated_network --name mongodb mongo
# docker run -d --net=isolated_network --name nodeapp -p 8080:3000 <username>/mongo-node

# Seed the database with sample database
# Run: docker exec nodeapp node dbSeeder.js

# Side note, to view the container logs, we can log into it by the command - docker logs <id / name>

FROM node:latest

LABEL author="Anthony Vest"

ENV NODE_ENV=development 
ENV PORT=3000

COPY      . /src/www
WORKDIR   /src/www

RUN  npm install && npm cache clean --force

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]