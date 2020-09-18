#!/usr/bin/env sh

QUEUEDIR=$HOME/.msmtpqueue

for i in $QUEUEDIR/*.mail; do
  grep -E -s --color -h '(^From:|^To:|^Subject:)' "$i" || echo "No mail in queue";
  echo " "
done
