#!/bin/bash
[[ ! -z "${K_FILE-}" ]] && return
K_FILE=1

file_exists() {
  if [[ -f "$1" ]]; then
    return 0
  else 
    return 1
  fi
}

directory_exists() {
  if [[ -d "$1" ]]; then
    return 0
  else 
    return 1
  fi
}

file_path_exists() {
  if file_exists "$1" || directory_exists "$1"; then
    return 0
  else
    return 1
  fi
}