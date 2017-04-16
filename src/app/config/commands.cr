cli = Commander::Command.new do |cmd|
  cmd.use = "my_program"
  cmd.long = "my program's (long) description."

  cmd.flags.add do |flag|
    flag.name = "env"
    flag.short = "-e"
    flag.long = "--env"
    flag.default = "development"
    flag.description = "The environment to run in."
  end

  cmd.flags.add do |flag|
    flag.name = "port"
    flag.short = "-p"
    flag.long = "--port"
    flag.default = 8080
    flag.description = "The port to bind to."
  end

  cmd.flags.add do |flag|
    flag.name = "timeout"
    flag.short = "-t"
    flag.long = "--timeout"
    flag.default = 29.5
    flag.description = "The wait time before dropping the connection."
  end

  cmd.flags.add do |flag|
    flag.name = "verbose"
    flag.short = "-v"
    flag.long = "--verbose"
    flag.default = false
    flag.description = "Enable more verbose logging."
  end

  cmd.run do |options, arguments|
    options.string["env"]    # => "development"
    options.int["port"]      # => 8080
    options.float["timeout"] # => 29.5
    options.bool["verbose"]  # => false
    arguments                # => Array(String)
    puts cmd.help            # => Render help screen
  end

  cmd.commands.add do |cmd|
    cmd.use = "kill <pid>"
    cmd.short = "Kills server by pid."
    cmd.long = cmd.short
    cmd.run do |options, arguments|
      arguments # => ["62719"]
    end
  end
end

Commander.run(cli, ARGV)
