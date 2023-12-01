For part of the challenge, I created a NestJS node application to show how I would do it
with a framework and language I am familiar with. There are two ways to run this application:
1. Using Docker
2. Using NodeJS

I have included a simple javascript script to test the application. You can run it by
running `node scripts/add-messages-to-queue.js` in the node directory of this project.
By deafult, it will add 100 messages randomly to 4 queues. You can change this by 
change this by running it like so: 
`node scripts/add-messages-to-queue.js <number of messages> <number of queues>`

### Using Docker
1. Install Docker
2. Run `docker-compose up` in the node directory of this project
3. The application will be running on port 4000

### Using NodeJS
1. Install NodeJS
2. Run `yarn install` in the node directory of this project
3. Run `yarn start` in the node directory of this project

