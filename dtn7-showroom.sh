#!/bin/sh
clear

DOCKERCMD=docker
# use podman if available
if command -v podman &> /dev/null; then
  DOCKERCMD=podman
fi

SHARED=shared
# check is first parameter is not empty 
if [ -n "$1" ]; then
    SHARED=$1
fi

if [ ! -d "$SHARED" ]; then
    mkdir -p $SHARED
fi

echo
echo "'########::'########:'##::: ##:'########::'######::'##::::'##::'#######::'##:::::'##:'########:::'#######:::'#######::'##::::'##:"
echo " ##.... ##:... ##..:: ###:: ##: ##..  ##:'##... ##: ##:::: ##:'##.... ##: ##:'##: ##: ##.... ##:'##.... ##:'##.... ##: ###::'###:"
echo " ##:::: ##:::: ##:::: ####: ##:..:: ##::: ##:::..:: ##:::: ##: ##:::: ##: ##: ##: ##: ##:::: ##: ##:::: ##: ##:::: ##: ####'####:"
echo " ##:::: ##:::: ##:::: ## ## ##:::: ##::::. ######:: #########: ##:::: ##: ##: ##: ##: ########:: ##:::: ##: ##:::: ##: ## ### ##:"
echo " ##:::: ##:::: ##:::: ##. ####::: ##::::::..... ##: ##.... ##: ##:::: ##: ##: ##: ##: ##.. ##::: ##:::: ##: ##:::: ##: ##. #: ##:"
echo " ##:::: ##:::: ##:::: ##:. ###::: ##:::::'##::: ##: ##:::: ##: ##:::: ##: ##: ##: ##: ##::. ##:: ##:::: ##: ##:::: ##: ##:.:: ##:"
echo " ########::::: ##:::: ##::. ##::: ##:::::. ######:: ##:::: ##:. #######::. ###. ###:: ##:::. ##:. #######::. #######:: ##:::: ##:"
echo "........::::::..:::::..::::..::::..:::::::......:::..:::::..:::.......::::...::...:::..:::::..:::.......::::.......:::..:::::..::"
echo
echo "==> vnc://127.0.0.1:5901"
echo "==> password: sneakers"
echo 
echo "==> Shared folder: $SHARED"
echo
$DOCKERCMD run --rm -it                             \
    --name showroom                                 \
    -p 5901:5901                                    \
    -p 50052:50051                                  \
    -p 2023:22                                      \
    -p 1190:1190                                    \
    -v $SHARED:/shared                              \
    --privileged                                    \
    gh0st42/dtn7-showroom
