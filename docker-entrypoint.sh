#!/bin/bash

if [[ -z "${INTERFACE}" ]]; then
  suricata -v -c /etc/suricata/suricata.yaml -i eth0 --init-errors-fatal
else
  sed -i "s/eth0/${INTERFACE}/g" /etc/suricata/suricata.yaml
  suricata -v -c /etc/suricata/suricata.yaml -i ${INTERFACE} --init-errors-fatal
fi