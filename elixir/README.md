Given Challenge
1. You should have an HTTP endpoint at the path /receive-message which accepts a GET request with the query string parameters queue (string) and message (string).
2. Your application should accept messages as quickly as they come in and return a 200 status code.
3. Your application should "process" the messages by printing the message text to the terminal, however for each queue, your application should only "process" one message a second, no matter how quickly the messages are submitted to the HTTP endpoint.

For part of the challenge, I created a Phoenix elixir application to show how I would do it
with a framework and language I am not familiar with. The best way to run this application:
1. Using Docker
2. Using mix (you will need to update the dev.exs file to point to your local postgres database)

### Using Docker
1. Install Docker
2. Run `docker-compose up` in the elixir directory of this project
3. The application will be running on port 4000

### Using Mix
1. Install Elixir
2. Run `mix setup` in the elixir directory of this project
3. Run `mix phx.server` in the elixir directory of this project
4. The application will be running on port 4000

