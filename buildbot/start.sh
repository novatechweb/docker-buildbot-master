#!/bin/sh

mkdir -p $HOME/.ssh
cp -R /run/secrets/ssh/* $HOME/.ssh
chmod -R 600 $HOME/.ssh

ln -v -s -f /home/buildbot/buildbot.tac /home/buildbot/master.cfg /home/buildbot/*.py /buildbot

/usr/bin/buildbot --verbose upgrade-master
exec twistd --nodaemon --logfile=- --pidfile=/tmp/twistd.pid --python=buildbot.tac