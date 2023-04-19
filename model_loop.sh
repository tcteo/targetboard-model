#!/bin/bash

watch_dirs=("targetboard")
inotifywait="$(which inotifywait)"

if [ -z "${inotifywait}" ]; then
  echo 'could not find inotifywait'
  echo 'on debian/ubuntu: sudo apt install inotify-tools'
  exit 1
fi

${inotifywait} -e close_write,moved_to,create,delete,moved_from -r -m "${watch_dirs[@]}" |
while read -r directory events filename; do
  # echo  "${filename}"
  if [[ "${filename}" =~ pyc ]]; then
    # echo '  - skip -'
    continue
  fi
  echo "$(date "+%Y-%m-%d %H:%M:%S"): Regenerating model..."
  ./model.sh
done
