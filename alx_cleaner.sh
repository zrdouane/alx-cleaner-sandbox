#!/bin/bash

# #banner
echo -e " ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄     ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄    ▄▄▄▄▄▄ ▄▄▄     ▄▄   ▄▄ "
echo -e "█       █       █       █   █   █  ▄    █       █  █▄█  █  █      █   █   █  █▄█  █"
echo -e "█▄     ▄█   ▄   █   ▄   █   █   █ █▄█   █   ▄   █       █  █  ▄   █   █   █       █"
echo -e "  █   █ █  █ █  █  █ █  █   █   █       █  █ █  █       █  █ █▄█  █   █   █       █"
echo -e "  █   █ █  █▄█  █  █▄█  █   █▄▄▄█  ▄   ██  █▄█  ██     █   █      █   █▄▄▄ █     █ "
echo -e "  █   █ █       █       █       █ █▄█   █       █   ▄   █  █  ▄   █       █   ▄   █"
echo -e "  █▄▄▄█ █▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█  █▄█ █▄▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█"

echo -en "\n    	    	  \033[31m By: "
echo -e "\033[34mzrdouane\033[0m"
echo -e	"	       report any issues to me in:"
echo -e	"               GitHub   ~> https://github.com/zrdouane"
echo -e	"	       alx Slack ~> Zakariardouane"
echo -e "	       if you need me to add something in this toolbox feel free to say it."

sleep 0.05
echo -e "\033[2J\033[?25l"; R=`tput lines` C=`tput cols`;: $[R--] ;
start=$(date +%s)

while true
do
  (
    e=echo\ -e
    s=sleep
    j=$[RANDOM%C]
    d=$[RANDOM%R]
    for i in `eval $e {1..$R}`;
    do
      c=`printf '\\\\0%o' $[RANDOM%57+33]`
      $e "\033[$[i-1];${j}H\033[32m$c\033[$i;${j}H\033[37m"$c
      $s 0.1
      if [ $i -ge $d ]
      then
        $e "\033[$[i-d];${j}H "
      fi
    done
    for i in `eval $e {$[i-d]..$R}`;
    do
      echo -e "\033[$i;${j}f "
      $s 0.1
    done
  ) &
  sleep 0.05
  current=$(date +%s)
  elapsed=$((current - start))
  if [ $elapsed -ge 3 ]; then
    break
  fi
done

sleep 6

Storage=$(df -h "$HOME" | awk '{print($2)}' | grep G)

Used_space=$(df -h "$HOME" | awk '{print($3)}' | grep G)

Available=$(df -h "$HOME" | awk '{print($4)}' | grep G)

echo -e "\033[33m\n -- Storage Before Cleaning : $Storage \033[0m"
echo -e "\x1b[31m\n -- space used  : $Used_space \033[0m"
echo -e "\x1b[32m\n -- Available Storage : $Available \033[0m"
#echo -e "\033[31m\n -- Cleaning ...\n\033[0m "
echo -e "\n"

echo -e "\033[34mEnter 1 to install Homebrew or 2 to install ZSH:"
read input

if [ $input == 1 ]; then
  # Check if Homebrew is already installed
  if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    echo -e "\033[32mHomebrew is already installed. Skipping installation."
  fi
elif [ $input == 2 ]; then
  # Check if ZSH is already installed
  if test ! $(which zsh); then
    echo -e "\033[33mInstalling ZSH..."
    brew install zsh
  else
    echo -e "\033[32mZSH is already installed. Skipping installation."
  fi
else
  echo -e "\033[31mInvalid input. Exiting."
fi