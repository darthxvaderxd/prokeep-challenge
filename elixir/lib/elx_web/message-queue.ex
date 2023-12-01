# i chose to write the file to disk, because i am not familiar with elixir
# and i wanted to make sure i could get the queue working as not sure if
# there is a way to use a global store in elixir

defmodule MessageQueue do
  def storeMapToDisk(queues) do
    File.write!("message-queue.txt", :erlang.term_to_binary(queues))
  end

  def loadMapFromDisk() do
    if !File.exists?("message-queue.txt") do
      storeMapToDisk(%{})
    end

    File.read!("message-queue.txt")
      |> :erlang.binary_to_term()
  end

  def addNewMessageForQueue(queue, message) do
    queues = loadMapFromDisk()

    if Map.has_key?(queues, queue) do
      # add message to queue
      queues = Map.put(queues, queue, [message | Map.get(queues, queue)])
      storeMapToDisk(queues)
    else
      # create queue and add message to queue
      queues = Map.put(queues, queue, [message])
      storeMapToDisk(queues)
    end
  end

  def processMessageFromQueues() do
    queues = loadMapFromDisk()
    keys = Map.keys(queues)

    if Enum.count(keys) > 0 do
      for key <- keys do
        list = Map.get(queues, key)
        # get message from queue
        message = List.first(list)
        # remove message from queue
        list = List.delete_at(list, 0)
        # update queue
        if Enum.count(list) == 0 do
          queues = Map.delete(queues, key)
          storeMapToDisk(queues)
        else
          queues = Map.put(queues, key, list)
          storeMapToDisk(queues)
        end
        # print to console "queue: $queue, message: $message"
        IO.puts "#{NaiveDateTime.utc_now} queue: #{inspect key}, message: #{inspect message}"
      end
    end
  end
end