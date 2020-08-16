#!/bin/sh

if [ ! -e /aozoraepub3/AozoraEpub3.ini ]; then
  narou init -p /aozoraepub3 -l 1.8
  narou s convert.no-strip=true
  narou s convert.no-open=true
  # To reduce processing time
  narou s default.enable_illust=false
  narou s update.convert-only-new-arrival=true
  narou s device=kindle
  narou s convert.copy-to=/output
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
exec "$@"
