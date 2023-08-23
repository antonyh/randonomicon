FROM jekyll/jekyll:3.8.6
COPY ./start.sh /start.sh
WORKDIR /srv/jekyll
VOLUME  /srv/jekyll
EXPOSE 4000
CMD ["jekyll", "serve"]
ENTRYPOINT ["/start.sh"]
