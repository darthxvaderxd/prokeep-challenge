defmodule MessageQueue do
  def storeMapToDisk(queues) do
    File.write!("message-queue.txt", :erlang.term_to_binary(queues))
  end

  def addNewMessageForQueue(queue, message) do
    if !File.exists?("message-queue.txt") do
      storeMapToDisk(%{})
    end

    queues =  File.read!("message-queue.txt")
      |> :erlang.binary_to_term()

    IO.puts("queues: #{inspect queues}")

    if Map.has_key?(queues, queue) do
      IO.puts("has key #{inspect queue}")
      # add message to queue
      queues = Map.put(queues, queue, [message | Map.get(queues, queue)])
      storeMapToDisk(queues)
    else
      IO.puts("does not have key #{inspect queue}")
      # create queue and add message to queue
      queues = Map.put(queues, queue, [message])
      storeMapToDisk(queues)
    end
  end

  def processMessageFromQueues() do
    if !File.exists?("message-queue.txt") do
      storeMapToDisk(%{})
    end

    queues =  File.read!("message-queue.txt")
      |> :erlang.binary_to_term()

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