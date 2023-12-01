defmodule ElxWeb.MessageController do
  use ElxWeb, :controller

  def addMessageToQueue(conn, %{ "queue" => queue, "message" => message } = params) do
    if queue == nil do
      conn
      |> put_status(:bad_request)
      |> text("No queue specified")
    end

    if message == nil do
      conn
      |> put_status(:bad_request)
      |> text("No message specified")
    end

    if queue && message do
      MessageQueue.addNewMessageForQueue(queue, message)
      conn
      |> put_status(:ok)
      |> text("Message added to queue")
    end
  end
end