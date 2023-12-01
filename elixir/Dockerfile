FROM elixir:1.15.7-alpine as base
WORKDIR /app
COPY . .

FROM base as dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

FROM dependencies as build
EXPOSE 4000

CMD ["mix", "phx.server"]