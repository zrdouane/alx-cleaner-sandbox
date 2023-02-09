#!/bin/bash

# #banner
echo -e "#    _______                                         ____                   __       "
echo -e "#   / ___/ /__ ___ ____  ___ ____  ___ ___ ____  ___/ / /  ___ __ __  ___ _/ /_ __   "
echo -e "#  / /__/ / -_) _  / _ \/ -_) __/ (_-</ _  / _ \/ _  / _ \/ _ \\ \ / / _  / /\ \ /   "                                                                                                                                                                   
echo -e "#  \___/_/\__/\_,_/_//_/\__/_/   /___/\_,_/_//_/\_,_/_.__/\___/_\_\  \_,_/_//_\_\    "
echo -en "\n    	    	  \033[31m By: "
echo -e "\033[34mzrdouane\033[0m \n"

sleep 3

Storage=$(df -h "$HOME" | awk '{print($2)}' | grep G)

Used_space=$(df -h "$HOME" | awk '{print($3)}' | grep M)

Available=$(df -h "$HOME" | awk '{print($4)}' | grep G)
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi
echo -e "\033[33m\n -- Storage Before Cleaning : || $Storage || --\033[0m"
echo -e "\033[33m\n -- space used  : || $Used_space || --\033[0m"
echo -e "\033[33m\n -- Available Storage : || $Available || --\033[0m"
echo -e "\033[31m\n -- Cleaning ...\n\033[0m "
