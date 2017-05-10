# Matches GET "http://host:port/"
get "/" do
  render "src/views/pages/homepage.ecr", "src/views/layouts/main.ecr"
end
