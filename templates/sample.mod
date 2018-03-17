#!/usr/bin/env bash

# shellcheck shell=bash

# ``````````````````````````````````````````````````````````````````````````````
# Function name: sample()
#
# Description:
#   Sample module.
#
# Usage:
#   sample
#
# Examples:
#   sample
#

function sample() {

  # shellcheck disable=SC2034
  local _FUNCTION_ID="sample"
  local _STATE=0

  # User variables:
  # - module_name: store module name
  # - module_args: store module arguments

  _module_show=
  _module_help=
  _module_params=

  # shellcheck disable=SC2034
  author="example"
  contact="example@example.com"
  version="1.0"
  category="scanning"

  # shellcheck disable=SC2034,SC2154
  _module_show=$(printf "%s" "
    Module: ${module_name}
    Author: ${author}
   Contact: ${contact}
   Version: ${version}
  Category: ${category}
")

  # shellcheck disable=SC2034,SC2154
  _module_help=$(printf "%s" "
  Module: ${module_name}

    Description:

      It's a sample module template - short description.

    Options:

      show                            show info about module
      set                             set params for module

    Examples:

      show config                     displays the entire configuration
")

  _ipaddr="127.0.0.1"
  _port="80"
  _user="admin"
  _pass=""
  _iface="eth0"

  # shellcheck disable=SC2034,SC2154
  _module_params=(\
  "IP ADDRESS:${_ipaddr}" \
  "PORT NUMBER:${_port}" \
  "USERNAME:${_user}" \
  "PASSWORD:${_pass}" \
  "INTERFACE:${_iface}")

  # shellcheck disable=SC2034
  export _module_opts=(\
  "$_module_show" \
  "$_module_help")

  return $_STATE

}
