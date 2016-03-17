#!/bin/bash
docker stop my-ghost-blog_PRODUCTION
docker rm my-ghost-blog_PRODUCTION
docker run -d --name my-ghost-blog_PRODUCTION -e TARGET_THEME=my-ghost-theme -e NODE_ENV=production -p 80:2368 -v /usr/share/ghost-blogs/my-ghost-blog:/var/lib/ghost my-ghost-blog:0.1.0
