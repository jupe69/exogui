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

cnt=0
multi=false
content=false
[ -e ./eXo/Update/\!dos ] && rm ./eXo/Update/\!dos/*.*
[ -e ./eXo/Update/\!dos/linux/release ] && rm ./eXo/Update/\!dos/linux/release/*.*
[ -e ./eXo/Update/\!dos/linux ] && rm ./eXo/Update/\!dos/linux/*.*
[[ "$(ls -1 ./Content/*Magazines.zip 2>/dev/null | wc -l)" -gt 0 ]] && content=true
[[ "$(ls -1 ./Content/*Books.zip 2>/dev/null | wc -l)" -gt 0 ]] && content=true
[[ "$(ls -1 ./Content/*Catalogs.zip 2>/dev/null | wc -l)" -gt 0 ]] && content=true
[[ "$(ls -1 ./Content/*Soundtracks.zip 2>/dev/null | wc -l)" -gt 0 ]] && content=true
[[ "$(ls -1 ./Content/*Videos.zip 2>/dev/null | wc -l)" -gt 0 ]] && content=true
for f in ./Content/\!*.zip
do
    name2="${f}"
done
for a in ./Content/\!*.zip
do
    cnt="$(( $cnt + 1 ))"
done
clear
name="${name2:11:-12}"
[ "${cnt}" -gt 1 ] && multi=true
var="${PWD}"
merge=false
exist=false
freespace="$(df -P -B 1 . | awk 'NR==2 {print $4}')"
clear
[ ! -e LaunchBox.exe ] && goto a1 && [[ $0 != $BASH_SOURCE ]] && return
exist=true
cd eXo/util
[ ! -e util.zip ] && unzip -o \*.zip CHOICE.EXE
unzip -o util.zip CHOICE.EXE
cd ..
cd ..

[ "${content}" == false ] && goto keeptruckin && [[ $0 != $BASH_SOURCE ]] && return
if [ "${content}" == true ]
then
    clear
    echo ""
    echo "An eXo Project is already set up in this folder and the Media Add-On Pack"
    echo "has been detected. Do you want to install a full pack, or just add the"
    echo "Media Add-On Pack?"
    echo ""
    while true
    do
        read -p "[F]ull Install or just the [M]edia Add-On Pack? " choice
        case $choice in
            [Ff]* ) errorlevel=1
                    break;;
            [Mm]* ) errorlevel=2
                    break;;
            *     ) printf "Invalid input.\n";;
        esac
    done
    
    [ $errorlevel == '2' ] && goto mediainstall && [[ $0 != $BASH_SOURCE ]] && return
    [ $errorlevel == '1' ] && goto keeptruckin && [[ $0 != $BASH_SOURCE ]] && return
    
fi

: mediainstall
clear
echo ""
echo "Extracting Media Add-On Pack"
echo "Estimated Time: 10-15 minutes."
echo ""

[[ "$(ls -1 ./Content/*Magazines.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Magazines.zip -d ./
[[ "$(ls -1 ./Content/*Books.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Books.zip -d ./
[[ "$(ls -1 ./Content/*Catalogs.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Catalogs.zip -d ./
[[ "$(ls -1 ./Content/*Soundtracks.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Soundtracks.zip -d ./
[[ "$(ls -1 ./Content/*Videos.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Videos.zip -d ./
[ -e ./eXo/Catalogs/Ocean\ Ride\ the\ Ocean\ Wave\!\ \(1992\).pdf ] && mv "./eXo/Catalogs/Ocean Ride the Ocean Wave"\!" (1992).pdf" "./eXo/Catalogs/Ocean Ride the Ocean Wave (1992).pdf"
[ -e ./eXo/Catalogs/Microprose\ Just\ for\ Fun\!\ \(1989\).pdf ] && mv "./eXo/Catalogs/Microprose Just for Fun"\!" (1989).pdf" "./eXo/Catalogs/Microprose Just for Fun (1989).pdf"
[ -e ./eXo/Magazines/Gamebytes.msh ] && mv "./eXo/Magazines/Gamebytes.msh" "./eXo/Magazines/GameBytes.msh"

cd eXo/util
[[ "$(ls -1 ../../Content/*Magazines.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Magazines \&amp; Newsletters" -Literature
[[ "$(ls -1 ../../Content/*Books.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Books" -Literature
[[ "$(ls -1 ../../Content/*Catalogs.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Catalogs" -Literature
[[ "$(ls -1 ../../Content/*Soundtracks.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"Soundtracks" -Audio
[[ "$(ls -1 ../../Content/*Videos.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Videos" -Video
cd ../..
[[ "$(ls -1 ./Data/*_tmp.xml 2>/dev/null | wc -l)" -gt 0 ]] && rm ./Data/*_tmp.xml

clear
echo ""
echo "All Media has been extracted successfully. Enjoy"'!'""
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"
goto end && [[ $0 != $BASH_SOURCE ]] && return

: keeptruckin
clear
echo ""
echo "An eXo project or previous LaunchBox install has previously been setup in this folder."
echo ""
[ "${multi}" == true ] && echo "More than one eXo pack has been detected in this folder. If you continue"
[ "${multi}" == true ] && echo "they will all be installed together and merged."
[ "${multi}" == true ] && echo ""
[ "${multi}" == true ] && echo "Press C to Continue (This will Re-extract, Update or Install all eXo packs in this folder)"
[ "${multi}" == false ] && echo "Press C to Continue (This will Re-extract or Update the existing eXo packs)"
echo "Press E to Exit"
echo ""
[ "${multi}" == false ] && echo "If you wish to merge multiple eXo packs together, please ensure all of the packs have been copied"
[ "${multi}" == false ] && echo "to this folder before you run setup. If you wish to do this, please exit now and restart the Setup"
[ "${multi}" == false ] && echo "process once all files are in their proper place."
[ "${multi}" == false ] && echo ""
while true
do
    read -p "[C]ontinue or [E]xit " choice
    case $choice in
        [Cc]* ) errorlevel=1
                break;;
        [Ee]* ) errorlevel=2
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '2' ] && goto end && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto a1 && [[ $0 != $BASH_SOURCE ]] && return

: a1
cd eXo/util
[ ! -e util.zip ] && unzip -o \*.zip CHOICE.EXE
[ ! -e CHOICE.EXE ] && unzip -o util.zip CHOICE.EXE
cd ..
cd ..
clear

echo ""
[ "${multi}" == false ] && echo "                                    -=[WELCOME to eXo${name}]=-"
[ "${multi}" == true ] && echo "                                    -=[WELCOME to eXoMerge]=-"
echo ""

[ "${multi}" == true ] && echo "This setup will install all eXo projects whose files are in this folder. The following packs have been"
[ "${multi}" == true ] && echo "detected:"
if [ "${multi}" == true ]
then
    for f in ./Content/\!*.zip
    do
        pack2="$( tr -d "\!" <<<"${f}" )"
        pack="${pack2:10:-12}"
        echo "eXo${pack}"
    done
fi
[ "${multi}" == true ] && echo ""
[ "${multi}" == true ] && echo "If you do not see a pack listed that you wish to merge, please ensure it has been copied to this folder."

[ "${multi}" == false ] && echo "This setup will install eXo${name}."
[ "${multi}" == false ] && echo ""
[ "${multi}" == false ] && echo "However, if you wish to merge\\combine, you will want to ensure you have copied all of the projects you wish"
[ "${multi}" == false ] && echo "to merge into the folder you ran this setup file from."
[ "${multi}" == false ] && echo ""
[ "${multi}" == false ] && echo "For example, if you have downloaded both eXo${name} and another eXo pack, they can be combined into a single"
[ "${multi}" == false ] && echo "instance so that you may browse games from both packs in the same LaunchBox setup. To do this, simply copy"
[ "${multi}" == false ] && echo "all of the files (retaining their original folder structure) to the same folder. Then run this setup file."
[ "${multi}" == false ] && echo "The packs will be detected merged during the installation process."
echo ""
while true
do
    read -p "[C]ontinue, [E]xit, or [M]erge Instructions " choice
    case $choice in
        [Cc]* ) errorlevel=1
                break;;
        [Ee]* ) errorlevel=2
                break;;
        [Mm]* ) errorlevel=3
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '3' ] && goto mergei && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '2' ] && goto end && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto checks && [[ $0 != $BASH_SOURCE ]] && return

: mergei
clear
echo ""
echo "To merge eXo packs together, you will need to copy the files of all packs you wish to merge into the same folder."
echo "Specifically, you need to copy the following files and subfolders:"
echo "    .\\Content\\        <-FOLDER    "
echo "    .\\eXo\\            <-FOLDER    "
echo "    Setup.msh file    <-FILE      "
echo ""
echo "It is best to copy these files *before* running setup."
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"
goto a1 && [[ $0 != $BASH_SOURCE ]] && return

: checks
if [[ "$(ls -1 ./eXo/util/util*.zip 2>/dev/null | wc -l)" -eq 0 ]]
then
    clear
    echo ""
    echo "ERROR"
    echo ""
    echo "You are missing the util file. This file contains the emulators, along with several"
    echo "utilities required to run the games included with this pack."
    echo ""
    echo "The file resides in the .\\eXo\\util\\ folder"
    echo "Please make sure this file has been downloaded before proceeding with setup."
    echo ""
    echo "Exiting setup"
    read -s -n 1 -p "Press any key to continue..."
    printf "\n\n"
    goto end && [[ $0 != $BASH_SOURCE ]] && return
fi

if [ "${content}" == false ]
then
    clear
    echo ""
    echo "Content Add-On Pack Missing"
    echo ""
    echo "A media content pack is available. This includes magazines, books,"
    echo "catalogs, and soundtracks. If you wish to add these features, please download"
    echo "the content pack and ensure the files are in your .\\Content\\ folder."
    echo ""
    echo "At that point, run the setup file again and it will detect and add these"
    echo "features to your install."
    echo ""
    read -s -n 1 -p "Press any key to continue..."
    printf "\n\n"
    goto gamedata && [[ $0 != $BASH_SOURCE ]] && return
fi

if [ "${content}" == true ]
then
     clear
     echo ""
     [ ! -e ./Content/DOSBooks.zip ] && echo "Book Content Add-On Pack:		Missing"
     [ -e ./Content/DOSBooks.zip ] && echo "Book Content Add-On Pack:		Present"
     [ ! -e ./Content/DOSCatalogs.zip ] && echo "Catalog Content Add-On Pack:		Missing"
     [ -e ./Content/DOSCatalogs.zip ] && echo "Catalog Content Add-On Pack:		Present"
     [ ! -e ./Content/DOSMagazines.zip ] && echo "Magazine Content Add-On Pack:		Missing"
     [ -e ./Content/DOSMagazines.zip ] && echo "Magazine Content Add-On Pack:		Present"
     [ ! -e ./Content/DOSSoundtracks.zip ] && echo "Soundtrack Content Add-On Pack:		Missing"
     [ -e ./Content/DOSSoundtracks.zip ] && echo "Soundtrack Content Add-On Pack:		Present"
     [ -e ./Content/DOSVideos.zip ] && echo "Video Content Add-On Pack:		Present"
     [ ! -e ./Content/DOSVideos.zip ] && echo "Video Content Add-On Pack:		Missing"
     echo ""
     echo "A media content pack is available. This includes magazines, books,"
     echo "catalogs, and soundtracks. If you wish to add these features, please download"
     echo "the content pack and ensure the files are in your .\\Content folder."
     echo ""
     if [ ! -e ./Content/DOSSoundtracks.zip ]
     then
         read -s -n 1 -p "Press any key to continue..."
         printf "\n\n"
         goto gamedata && [[ $0 != $BASH_SOURCE ]] && return
     fi
     if [ ! -e ./Content/DOSCatalogs.zip ]
     then
         read -s -n 1 -p "Press any key to continue..."
         printf "\n\n"
         goto gamedata && [[ $0 != $BASH_SOURCE ]] && return
     fi
     if [ ! -e ./Content/DOSBooks.zip ]
     then
         read -s -n 1 -p "Press any key to continue..."
         printf "\n\n"
         goto gamedata && [[ $0 != $BASH_SOURCE ]] && return
     fi
     if [ ! -e ./Content/DOSMagazines.zip ]
     then
         read -s -n 1 -p "Press any key to continue..."
         printf "\n\n"
         goto gamedata && [[ $0 != $BASH_SOURCE ]] && return
     fi
     if [ ! -e ./Content/DOSVideos.zip ]
     then
         read -s -n 1 -p "Press any key to continue..."
         printf "\n\n"
         goto gamedata && [[ $0 != $BASH_SOURCE ]] && return
     fi
fi

: gamedata
[ ! -e ./Content/GameData ] && goto gerror && [[ $0 != $BASH_SOURCE ]] && return
goto metadata && [[ $0 != $BASH_SOURCE ]] && return

: gerror
clear
echo ""
echo "ERROR"
echo ""
echo "You are missing the GameData subfolder."
echo "This folder contains all of the manuals, music, and extras for each game."
echo ""
echo "This subfolder should be in your .\\Content\\ folder."
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"
goto end && [[ $0 != $BASH_SOURCE ]] && return

: metadata
[[ "$(ls -1 ./Content/\!*metadata.zip 2>/dev/null | wc -l)" -eq 0 ]] && goto merror && [[ $0 != $BASH_SOURCE ]] && return
goto lbcheck && [[ $0 != $BASH_SOURCE ]] && return

: merror
clear
echo ""
echo "ERROR"
echo ""
echo "You are missing the "'!'"metadata file ("'!'"<name>metadata.zip)."
echo "Without this, the entire pack is unplayable."
echo "This file contains the actual launch files and configuration files need to play the games."
echo "Please download this file and then re-run setup."
echo ""
echo "This file should be in your .\\Content\\ folder."
echo ""
echo "Exiting setup"
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"
goto end && [[ $0 != $BASH_SOURCE ]] && return

: lbcheck
if [ ! -e ./Content/LaunchBox.zip ]
then
    clear
    echo ""
    echo "ERROR"
    echo ""
    echo "You are missing the LaunchBox.zip file."
    echo "Without this, you will have no front end."
    echo ""
    echo "This file should be in your .\\Content\\ folder."
    echo ""
    echo "If you plan to use a different front end or no front end at all, you can choose"
    echo "to continue."
    echo ""
    goto check && [[ $0 != $BASH_SOURCE ]] && return
fi

if [ "${multi}" == true ]
then
    [[ "$(ls -1 ./Content/XO*Metadata.zip 2>/dev/null | wc -l)" -eq 0 ]] && goto m2error && [[ $0 != $BASH_SOURCE ]] && return
fi
if [ "${multi}" == false ]
then
    [ ! -e ./Content/XO"${name}"Metadata.zip ] && goto m2error && [[ $0 != $BASH_SOURCE ]] && return
fi
goto verify && [[ $0 != $BASH_SOURCE ]] && return

: m2error
clear
echo ""
echo "ERROR"
echo "You are missing the XOMetadata file (XO<name>Metadata.zip)."
echo "Without this LaunchBox will not run properly."
echo "This file contains the manuals, xml, and image data LaunchBox needs."
echo ""
echo "This file should be in your .\\Content\\ folder."
echo ""
echo "If you plan to use a different front end or no front end at all, you can choose"
echo "to continue."
echo ""
goto check && [[ $0 != $BASH_SOURCE ]] && return
done

: check
echo ""
echo "Do you want to continue setup without support for LaunchBox?"
echo ""
echo "Note: Launchbox is the front end. Without it, you will simply have a collection"
[ "${multi}" == false ] && echo "of ${name} zip files and a "'!'"${name} folder full of config files and game launch files."
[ "${multi}" == true ] && echo "of zip files and a folder full of config files and game launch files."
echo "Do not use this method if you aren't 100%% sure of what you are doing."
echo ""
while true
do
    read -p "(Y)es or (N)o " choice
    case $choice in
        [Yy]* ) errorlevel=1
                break;;
        [Nn]* ) errorlevel=2
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '2' ] && goto end && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto skip_lb && [[ $0 != $BASH_SOURCE ]] && return

: verify
clear
x64=false
# wmic os get osarchitecture > oscheck.txt
# echo "x$(getconf LONG_BIT)" > oscheck.txt
echo "AMD$(getconf LONG_BIT)" > oscheck.txt
for a in $(grep "AMD64" "oscheck.txt")
do
    x64=true
done
rm oscheck.txt

[ "${x64}" == false ] && goto 64check && [[ $0 != $BASH_SOURCE ]] && return
goto verified && [[ $0 != $BASH_SOURCE ]] && return

: 64check
clear
echo ""
echo "This machine is not reporting itself as 64 bit. LaunchBox, the front end,"
echo "will only run on a 64 bit machine."
echo ""
echo "There is a chance that your machine *is* 64 bit, and everything will function"
echo "fine. There are a handful of machines that do not report this normally."
echo "If you believe your machine is 64 bit, then please choose Yes below."
echo ""
echo "Would you like to continue installing LaunchBox?"
echo ""
echo "Press (Y)es to install everything"
echo "Press (N)o to only install the games, but not LaunchBox (the front end)"
echo ""
while true
do
    read -p "(Y)es or (N)o " choice
    case $choice in
        [Yy]* ) errorlevel=1
                break;;
        [Nn]* ) errorlevel=2
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '2' ] && goto skip_lb && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto verified && [[ $0 != $BASH_SOURCE ]] && return

: verified
clear
echo ""
echo "All files verified."
echo ""
echo "Beginning setup"
echo ""
[ "${content}" == false ] && echo "Step 1 of 3"
[ "${content}" == true ] && echo "Step 1 of 4"
echo "Extracting LaunchBox files"
echo "Estimated Time: Less than 5 minutes."
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"
echo "EXTRACTING..."

unzip -o ./Content/LaunchBox.zip -d ./
goto continue && [[ $0 != $BASH_SOURCE ]] && return

: skip_lb
echo ""
echo "Installation will now continue, but please be aware that the front-end may not"
echo "be functional on this machine. You may still run the games manually by navigating"
echo "to the games launch folder and running the launch file manually. These can be found"
echo "in:"
[ "${multi}" == false ] && echo "./eXo/eXo${name}/"'!'"${name}/"
[ "${multi}" == true ] && echo "./eXo/eXoPACK/"'!'"PACK/"
[ "${multi}" == true ] && echo "   *each PACK will have it's own name"
echo ""
echo "Apart from launching the games, the front end also contains metadata, screenshots,"
echo "manuals, box scans, game music, strategy guides, code wheels, and lots of other"
echo "interesting things for each game. It is highly recommended that you take the necessary"
echo "steps to get the frontend working."
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"
goto continue && [[ $0 != $BASH_SOURCE ]] && return

: continue
clear
echo ""
[ "${content}" == false ] && echo "Step 2 of 3"
[ "${content}" == true ] && echo "Step 2 of 4"
echo "Extracting LaunchBox Metadata"
echo "Estimated Time: 25-30 minutes."
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"

unzip -o ./Content/XO\*Metadata.zip -d ./
unzip -o ./Content/XODOSMetadata Plugins/eXoPlugin.dll -d ./

clear
echo ""
[ "${content}" == false ] && goto step3 && [[ $0 != $BASH_SOURCE ]] && return
[ "${content}" == true ] && echo "Step 3 of 4"
echo "Extracting Media Add-On Pack"
echo "Estimated Time: Depends on if you have the entire pack or not"
echo "                The full thing will take about an hour."
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"

[[ "$(ls -1 ./Content/*Magazines.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Magazines.zip -d ./
[[ "$(ls -1 ./Content/*Books.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Books.zip -d ./
[[ "$(ls -1 ./Content/*Catalogs.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Catalogs.zip -d ./
[[ "$(ls -1 ./Content/*Soundtracks.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Soundtracks.zip -d ./
[[ "$(ls -1 ./Content/*Videos.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./Content/\*Videos.zip -d ./
[ -e ./eXo/Catalogs/Ocean\ Ride\ the\ Ocean\ Wave\!\ \(1992\).pdf ] && mv "./eXo/Catalogs/Ocean Ride the Ocean Wave"\!" (1992).pdf" "./eXo/Catalogs/Ocean Ride the Ocean Wave (1992).pdf"
[ -e ./eXo/Catalogs/Microprose\ Just\ for\ Fun\!\ \(1989\).pdf ] && mv "./eXo/Catalogs/Microprose Just for Fun"\!" (1989).pdf" "./eXo/Catalogs/Microprose Just for Fun (1989).pdf"
[ -e ./eXo/Magazines/Gamebytes.msh ] && mv "./eXo/Magazines/Gamebytes.msh" "./eXo/Magazines/GameBytes.msh"

: step3
clear
echo ""
[ "${content}" == false ] && echo "Step 3 of 3"
[ "${content}" == true ] && echo "Step 4 of 4"
echo "Extracting Game Configuration Files"
echo "Estimated Time: 30-40 minutes."
echo ""
read -s -n 1 -p "Press any key to continue..."
printf "\n\n"

while read -d $'\0' a
do
    unzip -o ./Content/GameData/"${a}"/\*.zip -d ./
done < <(gfind ./Content/GameData -mindepth 1 -maxdepth 1 -type d -printf "%P\n\0" | sort -z)
unzip -o ./Content/\!\*metadata.zip -d ./

[ "${exist}" == false ] && goto skip && [[ $0 != $BASH_SOURCE ]] && return
: cleanup
cd eXo
cd util
cp unzip.exe ..
while read -d $'\0' f
do
    rm "${f}"
done < <(gfind . -maxdepth 1 -not -iname "*.zip" -not -iname "*.bsh" -not -iname "*.msh" -not -iname "*.bash" -not -iname "*.command" -not -iname "*.bat" -type f -print0)
for h in */
do
    rm -rf "${h}"
done
cp ../unzip.exe ./
rm ../unzip.exe
cd ..
cd ..

: skip
# if exist .\eXo\eXo"${name}"\!"${name}" rd .\eXo\eXo"${name}"\!"${name}" /s /q
# unzip -o .\Content\!"${name}"metadata.zip
# if "${merge}"==true unzip -o .\Content\!"${pack}"Metadata.zip -d .\
cd eXo
unzip -o ./util/util\*.zip -d ./util
[[ "$(ls -1 ./util/OPT*.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./util/OPT\*.zip -d ./util/
[[ "$(ls -1 ./util/EXT*.zip 2>/dev/null | wc -l)" -gt 0 ]] && unzip -o ./util/EXT\*.zip
[ -e ./util/deprotect.zip ] && rm ./util/deprotect.zip
rm ./util/OPT*.zip
rm ./util/EXT*.zip
unzip -o ./util/util.zip ssr.exe -d ./util/
[ ! -e ./util/scummvm.ini ] && goto skipsvm && [[ $0 != $BASH_SOURCE ]] && return
if [ ! -e ~/.local/share/scummvm/scummvm.ini ]
then
    mkdir ~/.local/share/scummvm
    cp ./util/scummvm.ini ~/.local/share/scummvm/scummvm.ini
fi
: skipsvm
cd ..
goto xml && [[ $0 != $BASH_SOURCE ]] && return

: skipxtract
goto xml && [[ $0 != $BASH_SOURCE ]] && return

: xml
clear
echo ""
echo "Would you like to remove access to Adult games from LaunchBox?"
echo ""
echo "Please read carefully: \"Adult\" refers to games with nudity rather than violence. Choosing YES"
echo "will remove them from the front end, but not remove them from your hard drive."
echo ""
echo "If they have previously been removed, choosing NO here will restore them in the front end."
echo ""
while true
do
    read -p "(Y)es or (N)o " choice
    case $choice in
        [Nn]* ) errorlevel=1
                break;;
        [Yy]* ) errorlevel=2
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '2' ] && goto yesa && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto noa && [[ $0 != $BASH_SOURCE ]] && return

: noa
[[ "$(ls -1 ./xml/all/*.xml 2>/dev/null | wc -l)" -gt 0 ]] && cp ./xml/all/*.xml ./Data/Platforms/
cp ./xml/Playlists/*.* ./Data/Playlists/
cd xml
scriptDirStack["${#scriptDirStack[@]}"]="$scriptDir"
eval source merge_parents.msh
scriptDir="${scriptDirStack["${#scriptDirStack[@]}"-1]}"
unset scriptDirStack["${#scriptDirStack[@]}"-1]
function goto
{
    shortcutName=$1
    newPosition=$(gsed -n -e "/: $shortcutName$/{:a;n;p;ba};" "$scriptDir/$(basename -- "$BASH_SOURCE")" )
    eval "$newPosition"
    exit
}
scriptDirStack["${#scriptDirStack[@]}"]="$scriptDir"
eval source merge_platforms.msh
scriptDir="${scriptDirStack["${#scriptDirStack[@]}"-1]}"
unset scriptDirStack["${#scriptDirStack[@]}"-1]
function goto
{
    shortcutName=$1
    newPosition=$(gsed -n -e "/: $shortcutName$/{:a;n;p;ba};" "$scriptDir/$(basename -- "$BASH_SOURCE")" )
    eval "$newPosition"
    exit
}
cd ..
cp ./xml/Platforms.xml ./Data/
cp ./xml/Parents.xml ./Data/
[ -e ./xml/MS-DOS.xml ] && rm ./xml/MS-DOS.xml
cd ./eXo/util
goto screen && [[ $0 != $BASH_SOURCE ]] && return

: yesa
[[ "$(ls -1 ./xml/family/*.xml 2>/dev/null | wc -l)" -gt 0 ]] && cp ./xml/family/*.xml ./Data/Platforms/
cp ./xml/Playlists/*.* ./Data/Playlists/
cd xml
scriptDirStack["${#scriptDirStack[@]}"]="$scriptDir"
eval source merge_parents.msh
scriptDir="${scriptDirStack["${#scriptDirStack[@]}"-1]}"
unset scriptDirStack["${#scriptDirStack[@]}"-1]
function goto
{
    shortcutName=$1
    newPosition=$(gsed -n -e "/: $shortcutName$/{:a;n;p;ba};" "$scriptDir/$(basename -- "$BASH_SOURCE")" )
    eval "$newPosition"
    exit
}
scriptDirStack["${#scriptDirStack[@]}"]="$scriptDir"
eval source merge_platforms.msh
scriptDir="${scriptDirStack["${#scriptDirStack[@]}"-1]}"
unset scriptDirStack["${#scriptDirStack[@]}"-1]
function goto
{
    shortcutName=$1
    newPosition=$(gsed -n -e "/: $shortcutName$/{:a;n;p;ba};" "$scriptDir/$(basename -- "$BASH_SOURCE")" )
    eval "$newPosition"
    exit
}
cd ..
cp ./xml/Platforms.xml ./Data/
cp ./xml/Parents.xml ./Data/
[ -e ./xml/MS-DOS.xml ] && rm ./xml/MS-DOS.xml
cd ./eXo/util
scriptDirStack["${#scriptDirStack[@]}"]="$scriptDir"
eval source fix_names.msh
scriptDir="${scriptDirStack["${#scriptDirStack[@]}"-1]}"
unset scriptDirStack["${#scriptDirStack[@]}"-1]
function goto
{
    shortcutName=$1
    newPosition=$(gsed -n -e "/: $shortcutName$/{:a;n;p;ba};" "$scriptDir/$(basename -- "$BASH_SOURCE")" )
    eval "$newPosition"
    exit
}
goto screen && [[ $0 != $BASH_SOURCE ]] && return

: screen
clear
echo ""
echo "Would you like [F]ullscreen or [W]indowed mode to be the default setting?"
echo ""
while true
do
    read -p "Please choose (F/W): " choice
    case $choice in
        [Ff]* ) errorlevel=1
                break;;
        [Ww]* ) errorlevel=2
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '2' ] && goto win && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto full && [[ $0 != $BASH_SOURCE ]] && return

: full
cd eXo
clear
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|fullscreen=false|fullscreen=true|g" ./emulators/dosbox/options_linux.conf
[ -e ./util/WIN.SEL ] && rm ./util/WIN.SEL
echo "" >  "./util/FULL.SEL"
cd ..
goto res && [[ $0 != $BASH_SOURCE ]] && return

: win
cd eXo
clear
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|fullscreen=true|fullscreen=false|g" ./emulators/dosbox/options_linux.conf
[ -e ./util/FULL.SEL ] && rm ./util/FULL.SEL
echo "" >  "./util/WIN.SEL"
cd ..
goto res && [[ $0 != $BASH_SOURCE ]] && return

: res
cd eXo
[ -e ./util/SML.SEL ] && rm ./util/SML.SEL
[ -e ./util/MED.SEL ] && rm ./util/MED.SEL
[ -e ./util/LRG.SEL ] && rm ./util/LRG.SEL
clear
echo ""
echo "What is your primary desktop resolution?"
echo "[L]arge (4k)"
echo "[M]edium (1080)"
echo "[S]mall (less than 1080)"
echo ""
echo "Note: This will be used to calculate the window size in windowed mode."
echo ""
while true
do
    read -p "Please choose (L/M/S): " choice
    case $choice in
        [Ll]* ) errorlevel=1
                break;;
        [Mm]* ) errorlevel=2
                break;;
        [Ss]* ) errorlevel=3
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '3' ] && goto small && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '2' ] && goto medium && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto large && [[ $0 != $BASH_SOURCE ]] && return

: large
clear
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|windowresolution=640x480|windowresolution=2560x1920|g" ./emulators/dosbox/options_linux.conf
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|windowresolution=1280x960|windowresolution=2560x1920|g" ./emulators/dosbox/options_linux.conf
echo "" >  "./util/LRG.SEL"
goto ratio && [[ $0 != $BASH_SOURCE ]] && return

: medium
clear
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|windowresolution=640x480|windowresolution=1280x960|g" ./emulators/dosbox/options_linux.conf
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|windowresolution=2560x1920|windowresolution=1280x960|g" ./emulators/dosbox/options_linux.conf
echo "" >  "./util/MED.SEL"
goto ratio && [[ $0 != $BASH_SOURCE ]] && return

: small
clear
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|windowresolution=1280x960|windowresolution=640x480|g" ./emulators/dosbox/options_linux.conf
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|windowresolution=2560x1920|windowresolution=640x480|g" ./emulators/dosbox/options_linux.conf
echo "" >  "./util/SML.SEL"
goto ratio && [[ $0 != $BASH_SOURCE ]] && return

: ratio
clear
echo ""
echo "Would you like to enable Aspect Correction for all games?"
echo ""
echo "Choosing Yes will attempt to preserve the game's original format. In fullscreen"
echo "mode this will introduce black bars on the sides."
echo ""
echo "Choosing No will stretch the image to fit your monitor."
echo ""
echo "Choosing Yes is useful for widescreen monitors which cause stretching or distortion."
echo ""
while true
do
    read -p "[Y]es or [N]o " choice
    case $choice in
        [Yy]* ) errorlevel=1
                break;;
        [Nn]* ) errorlevel=2
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '2' ] && goto aspectn && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto aspecty && [[ $0 != $BASH_SOURCE ]] && return

: aspecty
clear
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|aspect=false|aspect=true|g" ./emulators/dosbox/options_linux.conf
[ -e ./util/ANO.SEL ] && rm ./util/ANO.SEL
echo "" >  "./util/AYES.SEL"
goto ini && [[ $0 != $BASH_SOURCE ]] && return

: aspectn
clear
[ -e ./emulators/dosbox/options_linux.conf ] && gsed -i -e "s|aspect=true|aspect=false|g" ./emulators/dosbox/options_linux.conf
[ -e ./util/AYES.SEL ] && rm ./util/AYES.SEL
echo "" >  "./util/ANO.SEL"
goto ini && [[ $0 != $BASH_SOURCE ]] && return

: ini
cd ..
# echo ${PWD}\LaunchBox.exe > eXo.msh
# .\eXo\util\B2E /bat eXo.msh /exe eXo.exe /icon .\eXo\util\exodos.ico
# rm exo.msh

cd eXo/util
[[ "$(ls -1 ../../Content/*Magazines.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Magazines \&amp; Newsletters" -Literature
[[ "$(ls -1 ../../Content/*Books.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Books" -Literature
[[ "$(ls -1 ../../Content/*Catalogs.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Catalogs" -Literature
[[ "$(ls -1 ../../Content/*Soundtracks.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"Soundtracks" -Audio
[[ "$(ls -1 ../../Content/*Videos.zip 2>/dev/null | wc -l)" -gt 0 ]] && python3 eXoLBpm_linux.py -i - -"MS-DOS Videos" -Video
clear
cd ../..

ffplay -v 0 -nodisp -autoexit ./eXo/util/blow.mp3
clear
echo ""
[ "${multi}" == false ] && echo "eXo${name} is now setup. Enjoy"'!'""
[ "${multi}" == true ] && echo "Your eXoPacks are now setup. Enjoy"'!'""
# echo Run "eXo.exe" to start.
# echo
echo ""
echo "Would you like to create an icon on your desktop?"
echo ""
while true
do
    read -p "[Y]es or [N]o " choice
    case $choice in
        [Yy]* ) errorlevel=1
                break;;
        [Nn]* ) errorlevel=2
                break;;
        *     ) printf "Invalid input.\n";;
    esac
done

[ $errorlevel == '2' ] && goto end && [[ $0 != $BASH_SOURCE ]] && return
[ $errorlevel == '1' ] && goto shortcut && [[ $0 != $BASH_SOURCE ]] && return

: shortcut
osascript <<EOF
tell application "Finder"
   set myapp to POSIX file "${scriptDir}/exogui.app" as alias
   make new alias to myapp at Desktop
   set name of result to "eXoDOS.app"
end tell
EOF

: end
[[ $0 != $BASH_SOURCE ]] && return
