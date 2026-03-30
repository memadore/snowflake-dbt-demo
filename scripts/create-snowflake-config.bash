CONFIG_FILE="config.toml"

if [ -f ".env" ]; then
    source .env
fi

echo "=== Snowflake CLI Config Generator ==="
echo "Creating $CONFIG_FILE..."

cat > "$CONFIG_FILE" << EOF
default_connection_name = "local"
[connections]
[connections.local]
account = "${SNOWFLAKE_ACCOUNT}"
user = "${SNOWFLAKE_USER}"
authenticator="SNOWFLAKE_JWT"
private_key_path = "${SNOWFLAKE_PRIVATE_KEY_PATH}"
private_key_passphase = "${SNOWFLAKE_PRIVATE_KEY_PASSPHRASE}"
role = "${SNOWFLAKE_ROLE}"
warehouse = "${SNOWFLAKE_WAREHOUSE}"
database = "${SNOWFLAKE_DATABASE}"
schema = "${SNOWFLAKE_SCHEMA}"
EOF

chmod 0600 "$CONFIG_FILE"

echo "✓ Config file created successfully!"
echo "File contents:"
echo "=============================================="
cat "$CONFIG_FILE"
echo "=============================================="
echo "You can now use this config with: snow --connection local"
