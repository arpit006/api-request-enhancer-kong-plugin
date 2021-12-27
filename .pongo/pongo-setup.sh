#!/usr/bin/env sh

#export upstream_header_enrichment_redis_host="redis"
#export upstream_header_enrichment_redis_port="6379"
#export upstream_header_enrichment_redis_timeout_ms="10000"
#export upstream_header_enrichment_redis_connection_pool_size="50"
#export upstream_header_enrichment_redis_connection_keepalive_ms="20000"
#export upstream_header_enrichment_credentials='{"transport":"password","food":"password"}'
export KONG_PLUGINS="bundled,api-request-enhancer"

# installing dependencies
#luarocks install base64
#luarocks install lua-cjson

find /kong-plugin -maxdepth 1 -type f -name '*.rockspec' -exec luarocks install --only-deps {} \;

echo "kong start && tail -f /kong-plugin/servroot/logs/error.log" > /usr/bin/start_kong.sh
chmod 755 /usr/bin/start_kong.sh

# Link proxy source code to /kong/plugins (Pongo copies entire content of current directory to /kong-plugin path in the container
#  and also puts the same in LUA lookup path)
echo "Linking plugin sources to lua lookup path - /kong-plugin/kong/plugins"
mkdir -p /kong-plugin/kong/plugins/api-request-enhancer
ln -s /kong-plugin/src/*.lua /kong-plugin/kong/plugins/api-request-enhancer

