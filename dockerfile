FROM arm32v7/ruby:2.7-buster

LABEL maintainer "chikiny <chikiny@gmail.com>"

ENV NAROU_VERSION 3.5.1
ENV AOZORAEPUB3_VERSION 1.1.0b55Q
ENV AOZORAEPUB3_FILE AozoraEpub3-${AOZORAEPUB3_VERSION}

WORKDIR /temp

RUN set -x \
 # install AozoraEpub3
 && wget https://github.com/kyukyunyorituryo/AozoraEpub3/releases/download/${AOZORAEPUB3_VERSION}/${AOZORAEPUB3_FILE}.zip \
 && unzip -q ${AOZORAEPUB3_FILE} \
 && mv ${AOZORAEPUB3_FILE} /aozoraepub3 \
  # install openjdk11
 && apt update \
 && apt install -y openjdk-11-jdk \
 # install mobi generateor tools instad of kindlegen binary
 && apt install -y epub-utils libebook-tools-perl libepub-dev libepub0 calibre poppler-data fonts-takao-gothic fonts-takao-mincho \
 # install Narou.rb
 && gem install narou -v ${NAROU_VERSION} --no-document

COPY kindlegen /aozoraepub3
RUN chmod 777 /aozoraepub3/kindlegen

WORKDIR /novel

RUN rm -rf /temp
COPY init.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 33000-33001

ENTRYPOINT ["init.sh"]
CMD ["narou", "web", "-np", "33000"]
