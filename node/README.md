Given Challenge
1. You should have an HTTP endpoint at the path /receive-message which accepts a GET request with the query string parameters queue (string) and message (string).
2. Your application should accept messages as quickly as they come in and return a 200 status code.
3. Your application should "process" the messages by printing the message text to the terminal, however for each queue, your application should only "process" one message a second, no matter how quickly the messages are submitted to the HTTP endpoint.

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
4. The application will be running on port 4000

