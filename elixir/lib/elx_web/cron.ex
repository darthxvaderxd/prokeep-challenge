defmodule ElxWeb.Periodically do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def schedule_work() do
    Process.send_after(self(), :work, 1000) # every second
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    MessageQueue.processMessageFromQueues()
    schedule_work()
    {:noreply, state}
  end
end