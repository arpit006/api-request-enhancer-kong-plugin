local ReportsApiHandler = {
  PRIORITY = 1000
}

function ReportsApiHandler:preread()
  local reports = require "kong.reports"
  reports.send_ping()
  ngx.print("ok")
  ngx.exit(200)
end


return ReportsApiHandler
