#!/bin/bash


function cecho {
  while [ "$1" ]; do
    case "$1" in
    -normal)        color="\033[00m" ;;
    -black)         color="\033[30;01m" ;;
    -red)           color="\033[31;01m" ;;
    -green)         color="\033[32;01m" ;;
    -yellow)        color="\033[33;01m" ;;
    -blue)          color="\033[34;01m" ;;
    -magenta)       color="\033[35;01m" ;;
    -cyan)          color="\033[36;01m" ;;
    -white)         color="\033[37;01m" ;;
    -n)             one_line=1;   shift ; continue ;;
    *)              echo -n "$1"; shift ; continue ;;
    esac

    shift
    echo -en "$color"
    echo -en "$1"
    echo -en "\033[00m"
    shift

  done
  if [ ! $one_line ]; then
    echo
  fi
}

FILE=xdstools5.war
if [ ! -f $FILE ]; then
    cecho -blue "Downloading war file from github"
    wget https://github.com/usnistgov/iheos-toolkit2/releases/download/v6.0.1/xdstools6.0.1.war -O xdstools6.war
    else
    cecho -blue "war file already available, using existing instance"
fi
cecho -blue "Building the docker file"
docker build -t xdstools .
cecho -blue "Starting docker"
docker run -d --name xdstools -p 8080:8080 xdstools


