FROM ruby:3.1.2
MAINTAINER michael@lundie.io

# Install Jekyll dependencies
RUN apt-get update \
  && apt-get install -y \
    build-essential \
    python3-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# Install Jekyll and necessary gems for image
# > Note -> To Create a custom image, simply add necessary
# > GEMs here and rebuild the docker image.
RUN gem install \
  jekyll \
  jekyll-redirect-from \
  jekyll-archives \
  kramdown \
  rdiscount \
  rouge

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll"]