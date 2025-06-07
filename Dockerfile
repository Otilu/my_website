# Use official Elixir image
FROM hexpm/elixir:1.15.7-erlang-26.2.4-alpine-3.18.5 AS build

# Install dependencies
RUN apk add --no-cache build-base git nodejs npm python3

WORKDIR /app
COPY . .

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Fetch deps and compile
RUN mix deps.get && \
    mix deps.compile && \
    mix assets.deploy && \
    mix compile && \
    mix phx.digest && \
    MIX_ENV=prod mix release

# Final image
FROM alpine:3.18 AS app

RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app
COPY --from=build /app/_build/prod/rel/YOUR_APP_NAME ./

ENV HOME=/app

CMD ["bin/MY_WEBSITE", "start"]
