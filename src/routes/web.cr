# Matches GET "http://host:port/"
get "/" do
  render "src/views/pages/homepage.ecr", "src/views/layouts/main.ecr"
end

get "/layout-test" do
  render "src/views/pages/testingpage.ecr", "src/views/layouts/testinglayout.ecr"
end

get "/contact" do
  render "src/views/pages/contactpage.ecr", "src/views/layouts/testinglayout.ecr"
end

get "/protect" do |env|
  env.response.status_code = 403
end

get "/user" do
  name = "joe"
  render "src/views/pages/user.ecr", "src/views/layouts/main.ecr"
end
