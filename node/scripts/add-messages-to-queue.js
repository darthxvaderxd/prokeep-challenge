const http = require('http');

const numberOfMessages = Number(process?.argv[2] ?? 100);
const numberOfQueues = Number(process?.argv[3] ?? 4);

// limit number of http connections to 10
http.globalAgent.maxSockets = 10;

/**
 * Adds a message to a queue
 * @param queue - string the queue name
 * @param message - string the message to add to the queue
 * @returns {Promise}
 */
async function addMessageToQueue(queue, message) {
  return new Promise((resolve, reject) => {
    const url = `http://localhost:4000/?queue=${queue}&message=${message}`;

    const req = http.get(url, (res) => {
      console.log(`statusCode: ${res.statusCode} for queue ${queue} and message ${message}`);
      resolve();
    });

    req.on('error', (error) => {
      console.error(error);
      reject(error);
    });

    req.end();
  });
}

/**
 * Main function
 * @returns {Promise}
 */
async function main() {
  const promises = [];

  for (let i = 0; i < numberOfMessages; i += 1) {
    const queue = `queue-${Math.floor(Math.random() * numberOfQueues) + 1}`;
    const message = `hello world ${Math.random().toString(36).substring(7)}`;
    promises.push(addMessageToQueue(queue, message));
  }

  await Promise.all(promises);
}

main()
  .then(() => {
    console.log('Done');
  })
  .catch((error) => {
    console.error(error);
  });