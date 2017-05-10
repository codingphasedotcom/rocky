# Matches GET "http://host:port/"
get "/" do
  render "src/views/pages/homepage.ecr", "src/views/layouts/main.ecr"
end

get "/protect" do |env|
  env.response.status_code = 403
end

get "/movies" do
  MYSQL.exec "
      CREATE TABLE IF NOT EXISTS movies
      (
        id int not null auto_increment,
        title varchar(30),
        year int,
        description LONGTEXT,
        primary key (id)
      )"

  MYSQL.exec "
  INSERT INTO movies (title, year, description)
VALUES ('Star Trek', '1996', 'A SHITTY MOVIE');"
end
