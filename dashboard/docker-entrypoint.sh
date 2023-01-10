#!/bin/sh

set -e

# read ports from env variables or use defaults
NEXT_PUBLIC_NHOST_LOCAL_SUBDOMAIN="${NEXT_PUBLIC_NHOST_LOCAL_SUBDOMAIN:=localdev}"
NEXT_PUBLIC_NHOST_LOCAL_MIGRATIONS_PORT="${NEXT_PUBLIC_NHOST_LOCAL_MIGRATIONS_PORT:=9693}"
NEXT_PUBLIC_NHOST_LOCAL_HASURA_PORT="${NEXT_PUBLIC_NHOST_LOCAL_HASURA_PORT:=9695}"
NEXT_PUBLIC_NHOST_LOCAL_HASURA_CONSOLE_PORT="${NEXT_PUBLIC_NHOST_LOCAL_HASURA_CONSOLE_PORT:=9695}"
NEXT_PUBLIC_NHOST_LOCAL_BACKEND_PORT="${NEXT_PUBLIC_NHOST_LOCAL_BACKEND_PORT:=8080}"
NEXT_PUBLIC_NHOST_LOCAL_GRAPHQL_PORT="${NEXT_PUBLIC_NHOST_LOCAL_GRAPHQL_PORT:=8080}"
NEXT_PUBLIC_NHOST_LOCAL_SERVICES_PORT="${NEXT_PUBLIC_NHOST_LOCAL_SERVICES_PORT:=443}"

# replace placeholders
find dashboard -type f -exec sed -i "s/__NEXT_PUBLIC_NHOST_LOCAL_SUBDOMAIN__/${NEXT_PUBLIC_NHOST_LOCAL_SUBDOMAIN}/g" {} +
find dashboard -type f -exec sed -i "s/__NEXT_PUBLIC_NHOST_LOCAL_MIGRATIONS_PORT__/${NEXT_PUBLIC_NHOST_LOCAL_MIGRATIONS_PORT}/g" {} +
find dashboard -type f -exec sed -i "s/__NEXT_PUBLIC_NHOST_LOCAL_HASURA_PORT__/${NEXT_PUBLIC_NHOST_LOCAL_HASURA_PORT}/g" {} +
find dashboard -type f -exec sed -i "s/__NEXT_PUBLIC_NHOST_LOCAL_HASURA_CONSOLE_PORT__/${NEXT_PUBLIC_NHOST_LOCAL_HASURA_CONSOLE_PORT}/g" {} +
find dashboard -type f -exec sed -i "s/__NEXT_PUBLIC_NHOST_LOCAL_BACKEND_PORT__/${NEXT_PUBLIC_NHOST_LOCAL_BACKEND_PORT}/g" {} +
find dashboard -type f -exec sed -i "s/__NEXT_PUBLIC_NHOST_LOCAL_GRAPHQL_PORT__/${NEXT_PUBLIC_NHOST_LOCAL_GRAPHQL_PORT}/g" {} +
find dashboard -type f -exec sed -i "s/__NEXT_PUBLIC_NHOST_LOCAL_SERVICES_PORT__/${NEXT_PUBLIC_NHOST_LOCAL_SERVICES_PORT}/g" {} +

exec "$@"
