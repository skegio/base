FROM ubuntu:14.04
MAINTAINER Nate Jones <nate@endot.org>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install vim-nox locales sudo tmux git openssh-server curl tree less aptitude man wget unzip libfile-slurp-perl -y

# Set up UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen en_US.UTF-8
ENV LC_ALL en_US.utf8

# Ensure that color and time zone are correct
ENV TERM xterm-256color

EXPOSE 22

LABEL org.endot.dockdev.basetype="ubuntu"

RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd", "-D"]
