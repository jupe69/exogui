#!/usr/bin/env bash
if [[ "$LD_PRELOAD" =~ "gameoverlayrenderer" ]]
then
    LD_PRELOAD=""
fi
[[ $0 == $BASH_SOURCE ]] && cd "$( dirname "$0")"
scriptDir="$(cd "$( dirname "$BASH_SOURCE")" && pwd)"
[ $# -gt 0 ] && parameterone="$1"
[ $# -gt 1 ] && parametertwo="$2"
[ $# -gt 2 ] && parameterthree="$3"
[ $# -gt 3 ] && parameterfour="$4"

if [[ "$OSTYPE" == "linux-gnu"* ]]
then
    if [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "konsole" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "gnome-terminal-" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "xfce4-terminal" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "kgx" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "xterm" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "Eterm" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "x-terminal-emul" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "mate-terminal" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "terminator" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "urxvt" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "rxvt" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "termit" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "terminology" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "tilix" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "kitty" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p` = "aterm" ]
    then
        cd eXo/util
        source "$scriptDir/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")"
        exit 0
    elif [ `which konsole` ]
    then
        konsole -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which gnome-terminal` ]
    then
        gnome-terminal -- /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which xfce4-terminal` ]
    then
        xfce4-terminal -x /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which kgx` ]
    then
        kgx -e "/usr/bin/env bash \"$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")\" $@" &
        exit 0
    elif [ `which xterm` ]
    then
        xterm -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which uxterm` ]
    then
        uxterm -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which eterm` ]
    then
        Eterm -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which x-terminal-emulator` ]
    then
        x-terminal-emulator -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which mate-terminal` ]
    then
        eval mate-terminal -e \"/usr/bin/env bash \\\"$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")\\\" $@\" "$@" &
        exit 0
    elif [ `which terminator` ]
    then
        terminator -x /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which urxvt` ]
    then
        urxvt -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which rxvt` ]
    then
        rxvt -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which termit` ]
    then
        termit -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which lxterm` ]
    then
        lxterm -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which terminology` ]
    then
        terminology -e "/usr/bin/env bash \"$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")\" $@" &
        exit 0
    elif [ `which tilix` ]
    then
        tilix -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which kitty` ]
    then
        kitty -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    elif [ `which aterm` ]
    then
        aterm -e /usr/bin/env bash "$PWD/eXo/util/$(basename -- "${BASH_SOURCE%.command}.bsh")" "$@" &
        exit 0
    else
        exit ERRCODE "Weird system achievement unlocked: None of the 18 supported terminal emulators are installed."
    fi

    exit 0
fi

if [ "${BASH_VERSINFO:-0}" -lt 5 ]
then
    printf "\n\e[1;31;47mThe version of bash currently running is too old.\e[0m\n\n"
    printf "Please run the \e[1;33;40minstall_dependencies.command\e[0m script.\n"
    printf "Then, follow the instructions to install the required dependencies.\n"
    read -s -n 1 -p "Press any key to abort."
    printf "\n\n"
    exit 0
fi

function goto
{
    shortcutName=$1
    newPosition=$(gsed -n -e "/: $shortcutName$/{:a;n;p;ba};" "$scriptDir/$(basename -- "$BASH_SOURCE")" )
    eval "$newPosition"
    exit
}
alias :="goto"

function dynchoice
{
    local choices="$1"
    local textpmt="$2"
    local numofchoices="${#choices}"
    local choicesu="${choices^^}"
    local choicesl="${choices,,}"
    if [ "$numofchoices" -eq 10 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                [${choicesu:3:1}${choicesl:3:1}]* ) errorlevel=4
                        break;;
                [${choicesu:4:1}${choicesl:4:1}]* ) errorlevel=5
                        break;;
                [${choicesu:5:1}${choicesl:5:1}]* ) errorlevel=6
                        break;;
                [${choicesu:6:1}${choicesl:6:1}]* ) errorlevel=7
                        break;;
                [${choicesu:7:1}${choicesl:7:1}]* ) errorlevel=8
                        break;;
                [${choicesu:8:1}${choicesl:8:1}]* ) errorlevel=9
                        break;;
                [${choicesu:9:1}${choicesl:9:1}]* ) errorlevel=10
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 9 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                [${choicesu:3:1}${choicesl:3:1}]* ) errorlevel=4
                        break;;
                [${choicesu:4:1}${choicesl:4:1}]* ) errorlevel=5
                        break;;
                [${choicesu:5:1}${choicesl:5:1}]* ) errorlevel=6
                        break;;
                [${choicesu:6:1}${choicesl:6:1}]* ) errorlevel=7
                        break;;
                [${choicesu:7:1}${choicesl:7:1}]* ) errorlevel=8
                        break;;
                [${choicesu:8:1}${choicesl:8:1}]* ) errorlevel=9
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 8 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                [${choicesu:3:1}${choicesl:3:1}]* ) errorlevel=4
                        break;;
                [${choicesu:4:1}${choicesl:4:1}]* ) errorlevel=5
                        break;;
                [${choicesu:5:1}${choicesl:5:1}]* ) errorlevel=6
                        break;;
                [${choicesu:6:1}${choicesl:6:1}]* ) errorlevel=7
                        break;;
                [${choicesu:7:1}${choicesl:7:1}]* ) errorlevel=8
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 7 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                [${choicesu:3:1}${choicesl:3:1}]* ) errorlevel=4
                        break;;
                [${choicesu:4:1}${choicesl:4:1}]* ) errorlevel=5
                        break;;
                [${choicesu:5:1}${choicesl:5:1}]* ) errorlevel=6
                        break;;
                [${choicesu:6:1}${choicesl:6:1}]* ) errorlevel=7
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 6 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                [${choicesu:3:1}${choicesl:3:1}]* ) errorlevel=4
                        break;;
                [${choicesu:4:1}${choicesl:4:1}]* ) errorlevel=5
                        break;;
                [${choicesu:5:1}${choicesl:5:1}]* ) errorlevel=6
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 5 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                [${choicesu:3:1}${choicesl:3:1}]* ) errorlevel=4
                        break;;
                [${choicesu:4:1}${choicesl:4:1}]* ) errorlevel=5
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 4 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                [${choicesu:3:1}${choicesl:3:1}]* ) errorlevel=4
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 3 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                [${choicesu:2:1}${choicesl:2:1}]* ) errorlevel=3
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    elif [ "$numofchoices" -eq 2 ]
    then
        while true
        do
            read -p "$textpmt " choice
            case $choice in
                [${choicesu:0:1}${choicesl:0:1}]* ) errorlevel=1
                        break;;
                [${choicesu:1:1}${choicesl:1:1}]* ) errorlevel=2
                        break;;
                *     ) printf "Invalid input.\n";;
            esac
        done
    else
        printf "\n\e[1;31;47mError in dynamic case statement\041\041\041\e[0m"
        printf "\n\e[1;31;47mPlease report this to the team.\e[0m\n\n"
        read -s -n 1 -p "Press any key to abort."
        printf "\n\n"
        exit 0
    fi
    return
}

missingDependencies=no
! [[ `which brew` ]] && missingDependencies=yes
! [[ `which aria2c` ]] && missingDependencies=yes
! [[ `spctl --status | grep disabled` ]] && missingDependencies=yes
! [[ `which curl` ]] && missingDependencies=yes
! [[ `which python3` ]] && missingDependencies=yes
! [[ `which sed` ]] && missingDependencies=yes
! [[ `which unzip` ]] && missingDependencies=yes
! [[ `which wget` ]] && missingDependencies=yes

if [ $missingDependencies == "yes" ]
then
    printf "\n\e[1;31;47mOne or more dependencies are missing.\e[0m\n\n"
    printf "Please run the \e[1;33;40minstall_dependencies.command\e[0m script.\n"
    printf "Then, follow the instructions to install the required dependencies.\n"
    read -s -n 1 -p "Press any key to abort."
    printf "\n\n"
    exit 0
fi

function getsize
{
      echo "  size FROM Plugins\\eXoPlugin.dll: $(du -b "$1" | cut -f1)"
      echo "  size TO   Plugins\\eXoPlugin.dll: $(du -b "$2" | cut -f1)"
      [ $(du -b "$1" | cut -f1) -gt $(du -b "$2" | cut -f1) ] && rc=2
      [ $(du -b "$1" | cut -f1) -eq $(du -b "$2" | cut -f1) ] && rc=1
      [ $(du -b "$1" | cut -f1) -lt $(du -b "$2" | cut -f1) ] && rc=0
      echo "getsize: ${rc}"
      errorlevel="${rc}"
      return 0
}

echo "$(basename "${0%.*}"): This procedure merges two eXo projects into one following the instructions on youtube: zOFbuOZ-iyw"
echo ""
echo "Please ensure LaunchBox is NOT running during this process."
echo ""

: validation
#Check number of parameters
  [ "${parameterone}" == "" ] && goto explain && [[ $0 != $BASH_SOURCE ]] && return
  [ "${parametertwo}" == "" ] && err="Too few parameters given" && goto explain && [[ $0 != $BASH_SOURCE ]] && return
  [ "${parameterthree}" != "" ] && err="Too many parameters given" && goto explain && [[ $0 != $BASH_SOURCE ]] && return

#Check FROM parameter
  [[ "$(ls -1 "${parameterone}"/*.* 2>/dev/null | wc -l)" -eq 0 ]] && err="FROM folder ${parameterone} does not exist" && goto explain && [[ $0 != $BASH_SOURCE ]] && return
  exofrom="${parameterone}"

#Check TO parameter
  [[ "$(ls -1 "${parametertwo}"/*.* 2>/dev/null | wc -l)" -eq 0 ]] && err="TO folder ${parametertwo} does not exist" && goto explain && [[ $0 != $BASH_SOURCE ]] && return
  exoto="${parametertwo}"

#FROM folder should be different to TO folder
  [ "${exofrom}" == "${exoto}" ] && err="FROM ${parameterone} folder should be different to TO folder ${parametertwo}" && goto explain && [[ $0 != $BASH_SOURCE ]] && return

#Check if both FROM and TO folders are eXo folders
  for f in "${exofrom}" "${exoto}"
  do
        [ ! -e "${f}"/LaunchBox.exe ] && err="${f} Not recognized as a eXo project" && goto explain && [[ $0 != $BASH_SOURCE ]] && return
  done
  err=

: merge
  exolvl1folders="eXo Images Manuals Music Videos"
  exolvl2folders="Data/Platforms Data/Playlists"

  echo "We are going to move the necessary files and folders from \"${exofrom}\" to \"${exoto}\""
  echo "After this is done \"${exofrom}\" can be removed from your system,"
  echo "and the games can be played from \"${exoto}\"."
  echo ""
  echo "(please be patient, this procedure can take a looooooooong time)"
  echo "Press any key to continue or press Ctrl+c to abort"
  read -s -n 1
  printf "\n\n"
  echo ""
  echo "Moving folders from \"${exofrom}\" to \"${exoto}\":"
  for d in $(echo "${exolvl1folders}")
  do
        echo "  Moving ${d}..."
        cp -r "${exofrom}"/"${d}"/* "${exoto}"/"${d}" &>/dev/null
  done
  echo "Copying files from \"${exofrom}\" to \"${exoto}\":"
  for d in $(echo "${exolvl2folders}")
  do
        echo "  Copying ${d}..."
        cp -r "${exofrom}"/"${d}"/* "${exoto}"/"${d}" &>/dev/null
  done
  echo "Checking Plugins\\eXoPlugin.dll:"
  getsize "${exofrom}"/Plugins/eXoPlugin.dll "${exoto}"/Plugins/eXoPlugin.dll
  if [ "${errorlevel}" == 2 ]
  then
        echo "    eXo says \"Bigger is Better\": bigger size, copy"'!'""
        cp "${exofrom}"/Plugins/eXoPlugin.dll "${exoto}"/Plugins/eXoPlugin.dll &>/dev/null
        goto endmerge && [[ $0 != $BASH_SOURCE ]] && return
  fi
  if [ "${errorlevel}" == 1 ]
  then
        echo "    eXo says \"Bigger is Better\": equal size, no copy"
        goto endmerge && [[ $0 != $BASH_SOURCE ]] && return
  fi
  echo "    eXo says \"Bigger is Better\": smaller size, no copy"
: endmerge
  echo "Merge complete"'!'""
  echo ""
  echo "Now start ${exoto}, give it a minute or so and close it."
  echo "Then wait a few moments and start ${exoto} again. Now it will contain the ${exofrom} content"'!'""
  echo ""
  echo "You may want to manually configure ${exoto} to let ${exoto} show up under Computers."
  echo "Happy gaming with \"${exoto}\""'!'""
  read -s -n 1 -p "Press any key to continue..."
  printf "\n\n"
  goto end && [[ $0 != $BASH_SOURCE ]] && return



: explain
  echo "Parameters: [FROM folder] [TO folder]"
  echo "  FROM: existing eXo folder"
  echo "  TO:   existing eXo folder"
  echo ""
  echo "  i.e. $(basename "${0%.*}") \"/home/user/eXoWin3x\" \"/home/user/eXoDOS\""
  echo ""
  [ "${err}" != "" ] && echo "  ==> ${err}"
  read -s -n 1 -p "Press any key to continue..."
  printf "\n\n"
  goto end && [[ $0 != $BASH_SOURCE ]] && return

: end
[[ $0 != $BASH_SOURCE ]] && return
