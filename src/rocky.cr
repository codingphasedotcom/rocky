require "./rocky/*"
require "kemal"

module Rocky
  # TODO Put your code here
end

# Matches GET "http://host:port/"
get "/" do
  "Hello World!"
end

get "/:name" do |env|
  name = env.params.url["name"]
  render "src/views/hello.ecr"
end

# Creates a WebSocket handler.
# Matches "ws://host:port/socket"
ws "/socket" do |socket|
  socket.send "Hello from Kemal!"
end

Kemal.run
