#!/bin/bash
__DIR="$( cd "$( readlink -f $(dirname "${BASH_SOURCE[0]}" ))" && pwd )"
_ve/bin/python3 -m targetboard.model
