#!/usr/bin/env bash

# shellcheck shell=bash

# ``````````````````````````````````````````````````````````````````````````````
# Function name: nse_remote-access()
#
# Description:
#   NSE Remote Access Module.
#
# Usage:
#   nse_remote-access
#
# Examples:
#   nse_remote-access
#

function nse_remote-access() {

  # shellcheck disable=SC2034
  local _FUNCTION_ID="nse_remote-access"
  local _STATE=0

  # User variables:
  # - module_name: store module name
  # - module_args: store module arguments

  export _module_show=
  export _module_help=
  export _module_opts=
  export _module_commands=

  # shellcheck disable=SC2034
  _module_variables=()

  # shellcheck disable=SC2034
  author="trimstray"
  contact="trimstray@gmail.com"
  description="NSE Remote Access Module"

  # shellcheck disable=SC2034,SC2154
  _module_cfg="${_modules}/${module_name}.cfg"

  touch "$_module_cfg"

  # shellcheck disable=SC2034,SC2154
  _module_help=$(printf "%s: \\e[1;32m%s\\e[m" "
  Module" "${module_name}")

  _module_help+=$(printf "%s" "

    Description
    -----------

      NSE Remote Access Module.

    Commands
    --------

      help    <module>                display module or NSE help
      show    <key>                   display module or profile info
      config  <key>                   show module configuration
      set     <key>                   set module variable value
      use     <module>                reuse module (changed env)
      pushd   <key>|init|show|flush   command line commands stack
      search  <key>                   search key in all commands
      init    <alias|id> [--args]     run profile

      Options:

        <key>                         key value
        <value>                       profile alias or id

")

  # shellcheck disable=SC2154
  if [[ "$_mstate" -eq 0 ]] ; then

    if [[ -e "$_module_cfg" ]] && [[ -s "$_module_cfg" ]] ; then

      # shellcheck disable=SC1090
      source "$_module_cfg"

    else

      # shellcheck disable=SC2034
      _module_variables=()

      if [[ "${#_module_variables[@]}" -ne 0 ]] ; then

        printf "_module_variables=(\"%s\")\\n" "${_module_variables[@]}" > "$_module_cfg"

      fi

      _mstate=1

    fi

  else

    # shellcheck disable=SC1090
    source "$_module_cfg"

  fi

  # In the given commands you can use variables from the CLI config
  # command or the etc/main.cfg file.

  # shellcheck disable=SC2034
  _module_commands=(\
  #
  "https://nmap.org/nsedoc/scripts/rdp-enum-encryption.html;\
  ;rdp-enum-encryption;--script=rdp-enum-encryption" \
  #
  "https://nmap.org/nsedoc/scripts/rdp-vuln-ms12-020.html;\
  ;rdp-vuln-ms12-020;--script=rdp-vuln-ms12-020" \
  #
  "https://nmap.org/nsedoc/scripts/realvnc-auth-bypass.html;\
  ;realvnc-auth-bypass;--script=realvnc-auth-bypass" \
  #
  "https://nmap.org/nsedoc/scripts/ssh-auth-methods.html;\
  ;ssh-auth-methods;--script=ssh-auth-methods" \
  #
  "https://nmap.org/nsedoc/scripts/ssh-brute.html;\
  ;ssh-brute;--script=ssh-brute;\
  \"ssh-brute.timeout=5s\"" \
  #
  "https://nmap.org/nsedoc/scripts/ssh-hostkey.html;\
  ;ssh-hostkey;--script=ssh-hostkey;\
  \"ssh-hostkey.known-hosts\",\"ssh-hostkey.known-hosts-path\"" \
  #
  "https://nmap.org/nsedoc/scripts/ssh-publickey-acceptance.html;\
  ;ssh-publickey-acceptance;--script=ssh-publickey-acceptance;\
  \"knownbad\",\"ssh.privatekeys\",\"publickeydb\",\
  \"ssh.usernames\",\"ssh.publickeys\",\"ssh.passphrases\"" \
  #
  "https://nmap.org/nsedoc/scripts/ssh-run.html;\
  ;ssh-run;--script=ssh-run;\
  \"ssh-run.username\",\"ssh-run.cmd\",\"ssh-run.password\",\
  \"ssh-run.privatekey\",\"ssh-run.passphrase\"" \
  #
  "https://nmap.org/nsedoc/scripts/ssh2-enum-algos.html;\
  ;ssh2-enum-algos;--script=ssh2-enum-algos" \
  #
  "https://nmap.org/nsedoc/scripts/sshv1.html;\
  ;sshv1;--script=sshv1" \
  #
  "https://nmap.org/nsedoc/scripts/telnet-brute.html;\
  ;telnet-brute;--script=telnet-brute;\
  \"telnet-brute.autosize=true\",\"telnet-brute.timeout=5s\"" \
  #
  "https://nmap.org/nsedoc/scripts/telnet-encryption.html;\
  ;telnet-encryption;--script=telnet-encryption" \
  #
  "https://nmap.org/nsedoc/scripts/telnet-ntlm-info.html;\
  ;telnet-ntlm-info;--script=telnet-ntlm-info" \
  #
  "https://nmap.org/nsedoc/scripts/vnc-brute.html;\
  ;vnc-brute;--script=vnc-brute;\
  \"vnc-brute.bruteusers=false\"" \
  #
  "https://nmap.org/nsedoc/scripts/vnc-info.html;\
  ;vnc-info;--script=vnc-info" \
  #
  "https://nmap.org/nsedoc/scripts/vnc-title.html;\
  ;vnc-title;--script=vnc-title" \
  )

  # shellcheck disable=SC2034,SC2154
  _module_show=(\
      "${module_name}" \
      "${#_module_commands[@]}" \
      "${author}" \
      "${contact}" \
      "${description}" \
      )

  # shellcheck disable=SC2034
  export _module_opts=(\
  "$_module_help")

  return $_STATE

}
