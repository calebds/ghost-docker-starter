FROM ghost:0.7.5

# 1. move this entire repo into a temp directory
ADD . /docker_tmp
WORKDIR /docker_tmp

# 2. overwrite the default config with our own
RUN cp config.js /usr/src/ghost/config.example.js

# 3. download and install the target theme
RUN npm install --production
RUN cp -R node_modules/* /usr/src/ghost/content/themes

# 4. clean-up
WORKDIR /usr/src/ghost
RUN rm -r /docker_tmp

# 5. use our custom entry-point script
COPY .docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# 6. port and startup
EXPOSE 2368
CMD ["npm", "start"]
