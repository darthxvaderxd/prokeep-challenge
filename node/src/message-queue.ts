interface QueueRequest {
  message: string;
}

interface NewQueueRequest {
  queue: string;
  message: string;
}

interface Queues {
  [key: string]: QueueRequest[];
}

const queues: Queues = {};

export function addMessageForQueue(request: NewQueueRequest): boolean {
  if (!queues[request.queue]) {
    queues[request.queue] = [];
  }

  queues[request.queue].push({ message: request.message });

  return true;
}

export function processSingleMessageFromAllQueues(): void {
  const keys = Object.keys(queues);

  keys.forEach((queue) => {
    if (queues[queue].length > 0) {
      const queueMessage = queues[queue].shift();

      if (queueMessage) {
        console.log(new Date(), `Queue: ${queue} - Message: ${queueMessage.message}`);
      }
    }
  });
}
