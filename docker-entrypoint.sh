#!/bin/sh
exec /opt/mule/bin/mule \
  -M-Dmule.env="${MULE_ENV}" \
  -M-Dbybit.apiKey="${BYBIT_API_KEY}" \
  -M-Dbybit.apiSecret="${BYBIT_API_SECRET}" \
  -M-Ddb.name="${DB_NAME}" \
  -M-Ddb.user="${DB_USER}" \
  -M-Ddb.password="${DB_PASSWORD}" \
  -M-Dpermission.key="${URL_PERMISSION_KEY}" \
  -M-Dpermission.secret="${URL_PERMISSION_SECRET}" \
  -M-Dpermission.time="${PERMISSION_TIME}" \
  -M-Dsmtp.user="${SMTP_USER}" \
  -M-Dsmtp.password="${SMTP_PASSWORD}" \
  -M-Dtruststore.password="${TRUSTSTORE_PASSWORD}"
