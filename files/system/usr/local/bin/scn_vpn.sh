#! /usr/bin/env bash

source <(op completion bash)
export VPN_SCRIPT="'vpn-slice 10.0.0.0/8 gfis.tacom.army.mil keycloak.create.army.mil gitlab.create.army.mil my.create.army.mil login.microsoftonline.us'"
export VPN_URL="vpn.tardec-scn.hpc.mil"
export VPN_ARGUMENTS="--protocol=anyconnect --disable-ipv6 --no-proxy --no-deflate --authgroup=EXPERIMENTATION"
export SCN_PASSWORD=$(op read "op://Private/scn_vpn/password")

op read "op://Private/haynes5480/bah" | sudo -S bash -c "echo $SCN_PASSWORD | openconnect -v $VPN_URL -u USER-00021-Haynes --passwd-on-stdin --script $VPN_SCRIPT $VPN_ARGUMENTS"