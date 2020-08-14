#!/bin/sh
if [ ! -e /novel/.narou ]; then
  mkdir .narou
  narou s device=kindle
fi
if [ ! -e /novel/.narousetting ]; then
  mkdir -p .narousetting
  {
    echo "---";
    echo 'aozoraepub3dir: "/aozoraepub3"';
    echo 'over18: true';
    echo 'server-port: 33000';
    echo 'server-bind: 0.0.0.0';
  } | tee .narousetting/global_setting.yaml

  {
    echo "---";
    echo "already-server-boot: true";
  } | tee .narousetting/server_setting.yaml
fi

narou s convert.no-strip=true
narou s convert.no-open=true

exec "$@"
