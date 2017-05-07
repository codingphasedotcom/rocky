require "./config/database.cr"
require "./rocky/*"
require "kemal"
require "./config/errors.cr"
require "./routes/web.cr"

module Rocky
end

Kemal.run
