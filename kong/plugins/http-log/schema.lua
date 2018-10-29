local typedefs = require "kong.db.schema.typedefs"

return {
  name = "http-log",
  fields = {
    { config = {
        type = "record",
        fields = {
          { mesh_mode = typedefs.mesh_mode_two_way },
          { http_endpoint = typedefs.url({ required = true }) },
          { method = { type = "string", default = "POST", one_of = { "POST", "PUT", "PATCH" }, }, },
          { content_type = { type = "string", default = "application/json", one_of = { "application/json" }, }, },
          { timeout = { type = "number", default = 10000 }, },
          { keepalive = { type = "number", default = 60000 }, },
          { retry_count = { type = "integer", default = 10 }, },
          { queue_size = { type = "integer", default = 1 }, },
          { flush_timeout = { type = "number", default = 2 }, },
    }, }, },
  },
}
