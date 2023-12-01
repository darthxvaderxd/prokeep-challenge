const http = require('http');

const numberOfMessages = Number(process?.argv[2] ?? 100);
const numberOfQueues = Number(process?.argv[3] ?? 4);

for (let i = 0; i < numberOfMessages; i += 1) {
  const queue = `queue-${Math.floor(Math.random() * numberOfQueues) + 1}`;
  const message = `hello world ${Math.random().toString(36).substring(7)}`;
  const url = `http://localhost:4000/?queue=${queue}&message=${message}`;

  console.log(`Sending message to ${queue}: ${message}`);

  const req = http.get(url, (res) => {
	console.log(`statusCode: ${res.statusCode}`);
  });

  req.on('error', (error) => {
	console.error(error);
  });

  req.end();
}