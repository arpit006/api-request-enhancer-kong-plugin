package = "api-request-enhancer"
version = "dev-1"
source = {
   url = "https://github.com/arpit006/api-request-enhancer-kong-plugin"
}
description = {
   homepage = "https://go-jek.atlassian.net/wiki/spaces/ICP/pages/2336623975/RFC+Upstream+Header+Enrichment+Plugin",
   license = ""
}

dependencies = {
}

build = {
   type = "builtin",
   modules = {
      ["kong.plugins.api-request-enhancer.handler"] = "src/handler.lua",
      ["kong.plugins.api-request-enhancer.schema"] = "src/schema.lua",
   }
}
