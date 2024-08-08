#!/bin/bash

set -e

find ./ -type f | grep '\.sql$' | xargs cat | sed '1i\\\c sql_recipe' >> ../infra/postgr
es/init/02_data.sql
