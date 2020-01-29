FROM jekyll/jekyll:3.8.6

WORKDIR /srv/jekyll
VOLUME  /srv/jekyll
EXPOSE 4000
CMD ["jekyll", "serve"]
ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
