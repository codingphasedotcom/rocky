require "mysql"

# Open a connection to MySQL
MYSQL = DB.open("mysql://root@localhost:3306/crystal")

# MYSQL.exec "create table contacts (name varchar(30), age int)"

# get "/posts/:id" do |env|
#   title = MYSQL.query_one?("SELECT title FROM posts WHERE id = ?", env.params.url["id"], as: {String})
#   "Loaded post #{title}"
# end


# Matches GET "http://host:port/"
get "/" do
  render "src/views/pages/home.ecr", "src/views/layouts/main.ecr"
end
#
# get "/:name" do |env|
#   name = env.params.url["name"]
#   render "src/views/scripts.ecr", "src/views/layouts/main.ecr"
# end
#
# # Creates a WebSocket handler.
# # Matches "ws://host:port/socket"
# ws "/socket" do |socket|
#   socket.send "Hello from Kemal!"
# end

at_exit { MYSQL.close } # Be sure to close the connection
