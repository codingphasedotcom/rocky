# Matches GET "http://host:port/"
get "/" do
  render "src/views/pages/homepage.ecr", "src/views/layouts/main.ecr"
end

get "/protect" do |env|
  env.response.status_code = 403
end
