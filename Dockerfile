FROM centos:centos6
MAINTAINER ann wallace <ann.wallace@nike.com>
ENV VERSION 0.01
RUN yum -y install git tar which gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel
RUN curl -sSL https://rvm.io/mpapis.asc |  gpg2 --import -
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN source /usr/local/rvm/scripts/rvm
ENV PATH $PATH:/usr/local/rvm/rubies/ruby-2.2.0/bin
RUN gem install daemons
RUN gem install aws-sdk-v1
RUN gem install log4r
RUN git clone -b v0.9b https://gitlab.pes.nike.com/awall6/sg-monkey.git /usr/local/monkey
CMD /usr/local/monkey/ami-monkey
