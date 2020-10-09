FROM ruby:2.6-stretch

#RUN apt update && apt-get install -y  --no-install-recommends software-properties-common  curl ruby ruby-dev
RUN apt update && apt-get install -y  software-properties-common  curl 
#RUN apt update && apt-get install -y  software-properties-common  curl dpkg-dev libgdbm-dev ruby ruby-dev


RUN add-apt-repository 'deb http://ftp.jp.debian.org/debian sid main'
#RUN apt remove -y libgcc-8-dev
RUN apt update && apt install -y --no-install-recommends criu

COPY zipkin-ruby-example /root/zipkin-ruby-example
COPY phaul /root/phaul
COPY start.sh /root

RUN gem install bundler 
RUN bundle install --gemfile=/root/zipkin-ruby-example/Gemfile

EXPOSE 80 8081 9000

CMD ["/root/start.sh"]
