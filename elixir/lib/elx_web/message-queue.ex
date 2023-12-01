defmodule MessageQueue do
  @queues %{}
  def addNewMessageForQueue(queue, message) do
    if Map.has_key?(@queues, queue) do
      # add message to queue
      @queues = Map.put(@queues, queue, [message | Map.get(@queues, queue)])
    else
      # create queue and add message to queue
      @queues = Map.put(@queues, queue, [message])
    end
  end

  def processMessageFromQueues() do
    keys = Map.keys(@queues)

    for key <- keys do
      # get message from queue
      message = List.first(Map.get(@queues, key))
      # remove message from queue
      @queues = Map.put(@queues, key, List.delete(Map.get(@queues, key), message))
      # print to console "queue: $queue, message: $message"
      IO.puts "queue: #{inspect key}, message: #{inspect message}"
    end
  end
end