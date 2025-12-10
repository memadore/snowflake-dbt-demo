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
account = "${DBT_SNOWFLAKE_ACCOUNT}"
user = "${DBT_SNOWFLAKE_USER}"
authenticator="SNOWFLAKE_JWT"
private_key_path = "${DBT_SNOWFLAKE_PRIVATE_KEY_PATH}"
private_key_passphase = "${DBT_SNOWFLAKE_PRIVATE_KEY_PASSPHRASE}"
role = "${DBT_SNOWFLAKE_ROLE}"
warehouse = "${DBT_SNOWFLAKE_WH}"
database = "${DBT_SNOWFLAKE_DATABASE}"
schema = "${DBT_SNOWFLAKE_SCHEMA}"
EOF

chmod 0600 "$CONFIG_FILE"

echo "✓ Config file created successfully!"
echo "File contents:"
echo "=============================================="
cat "$CONFIG_FILE"
echo "=============================================="
echo "You can now use this config with: snow --connection local"
