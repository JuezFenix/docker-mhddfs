#!/bin/bash

function term_handler {
  kill -SIGTERM ${!}
  echo "sending SIGTERM to child pid"
  fuse_unmount
  echo "exiting now"
  exit $?
}

function fuse_unmount {
  fusermount -u -z "$OUT"
}

if [ -z "${FILESYSTEMS}" ]; then
  echo "No filesystems specified!"
fi

trap term_handler SIGINT SIGTERM

  /usr/bin/mhddfs "$FILESYSTEMS" "$OUT" -o $OPTIONS
  echo "mhddfs started at: $(date +%Y.%m.%d-%T)"


exit 144
