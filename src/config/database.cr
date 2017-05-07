require "mysql"

# connect to localhost mysql test db
DB.open "mysql://root:root@127.0.0.1:3306/crystal" do |db|
  # db.exec "show databases"
  db.exec "drop table if exists movies"
  db.exec "
    create table movies
    (
      id int not null auto_increment,
      title varchar(30),
      year int,
      description LONGTEXT,
      primary key (id)
    )"

  db.exec "drop table if exists actors"
  db.exec "
    create table actors
    (
      id int not null auto_increment,
      first_name varchar(30),
      last_name varchar(30),
      year int,
      description LONGTEXT,
      primary key (id)
    )"
end

#
# DB.open "mysql://root:root@127.0.0.1:3306/crystal" do |db|
#   db.exec "drop table if exists contacts"
#   db.exec "create table contacts (name varchar(30), age int)"
#   db.exec "insert into contacts values (?, ?)", "John Doe", 30
#
#   args = [] of DB::Any
#   args << "Sarah"
#   args << 33
#   db.exec "insert into contacts values (?, ?)", args
#
#   puts "max age:"
#   puts db.scalar "select max(age) from contacts" # => 33
#
#   puts "contacts:"
#   db.query "select name, age from contacts order by age desc" do |rs|
#     puts "#{rs.column_name(0)} (#{rs.column_name(1)})"
#     # => name (age)
#     rs.each do
#       puts "#{rs.read(String)} (#{rs.read(Int32)})"
#       # => Sarah (33)
#       # => John Doe (30)
#     end
#   end
# end
