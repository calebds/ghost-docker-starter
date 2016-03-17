#!/bin/bash
docker stop my-ghost-blog_DEVELOPMENT
docker rm my-ghost-blog_DEVELOPMENT
docker run -d --name my-ghost-blog_DEVELOPMENT -e NODE_ENV=development -p 2368:2368 -v `pwd`:/var/lib/ghost my-ghost-blog:0.1.0
