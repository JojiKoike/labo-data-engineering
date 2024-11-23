#!/bin/bash

echo {mail,blog,eng,www,help,sub,ns,}.{robotics,ojisan,yamada,ueda,nakamura,tashiro,blacknon}.{com,net,org,jp,info,biz} |
	tr ' ' '\n' | sort -R | head -n 100 | sed 's/\.//'
