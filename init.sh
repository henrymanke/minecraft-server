#!/bin/sh

# Load the .env file, if available
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Check whether the required environment variables are set and set default values if not
echo "Generate server.properties based on the environment variables..."

# Standardwerte festlegen
SERVER_NAME=${SERVER_NAME:-"Minecraft Server"}
GAMEMODE=${GAMEMODE:-"survival"}
FORCE_GAMEMODE=${FORCE_GAMEMODE:-"false"}
DIFFICULTY=${DIFFICULTY:-"easy"}
ALLOW_CHEATS=${ALLOW_CHEATS:-"false"}
MAX_PLAYERS=${MAX_PLAYERS:-"10"}
ONLINE_MODE=${ONLINE_MODE:-"true"}
ALLOW_LIST=${ALLOW_LIST:-"false"}
SERVER_PORT=${SERVER_PORT:-"19132"}
SERVER_PORTV6=${SERVER_PORTV6:-"19133"}
ENABLE_LAN_VISIBILITY=${ENABLE_LAN_VISIBILITY:-"true"}
VIEW_DISTANCE=${VIEW_DISTANCE:-"32"}
TICK_DISTANCE=${TICK_DISTANCE:-"4"}
PLAYER_IDLE_TIMEOUT=${PLAYER_IDLE_TIMEOUT:-"30"}
MAX_THREADS=${MAX_THREADS:-"8"}
LEVEL_NAME=${LEVEL_NAME:-"Bedrock level"}
LEVEL_SEED=${LEVEL_SEED:-""}
DEFAULT_PLAYER_PERMISSION_LEVEL=${DEFAULT_PLAYER_PERMISSION_LEVEL:-"member"}
TEXTUREPACK_REQUIRED=${TEXTUREPACK_REQUIRED:-"false"}
CONTENT_LOG_FILE_ENABLED=${CONTENT_LOG_FILE_ENABLED:-"false"}
COMPRESSION_THRESHOLD=${COMPRESSION_THRESHOLD:-"1"}
COMPRESSION_ALGORITHM=${COMPRESSION_ALGORITHM:-"zlib"}
SERVER_AUTHORITATIVE_MOVEMENT=${SERVER_AUTHORITATIVE_MOVEMENT:-"server-auth"}
PLAYER_POSITION_ACCEPTANCE_THRESHOLD=${PLAYER_POSITION_ACCEPTANCE_THRESHOLD:-"0.5"}
PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHOLD=${PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHOLD:-"0.85"}
SERVER_AUTHORITATIVE_BLOCK_BREAKING_PICK_RANGE_SCALAR=${SERVER_AUTHORITATIVE_BLOCK_BREAKING_PICK_RANGE_SCALAR:-"1.5"}
CHAT_RESTRICTION=${CHAT_RESTRICTION:-"None"}
DISABLE_PLAYER_INTERACTION=${DISABLE_PLAYER_INTERACTION:-"false"}
CLIENT_SIDE_CHUNK_GENERATION_ENABLED=${CLIENT_SIDE_CHUNK_GENERATION_ENABLED:-"false"}
BLOCK_NETWORK_IDS_ARE_HASHES=${BLOCK_NETWORK_IDS_ARE_HASHES:-"false"}
DISABLE_PERSONA=${DISABLE_PERSONA:-"false"}
DISABLE_CUSTOM_SKINS=${DISABLE_CUSTOM_SKINS:-"false"}
SERVER_BUILD_RADIUS_RATIO=${SERVER_BUILD_RADIUS_RATIO:-"1.0"}
ALLOW_OUTBOUND_SCRIPT_DEBUGGING=${ALLOW_OUTBOUND_SCRIPT_DEBUGGING:-"false"}
ALLOW_INBOUND_SCRIPT_DEBUGGING=${ALLOW_INBOUND_SCRIPT_DEBUGGING:-"false"}
SCRIPT_DEBUGGER_AUTO_ATTACH=${SCRIPT_DEBUGGER_AUTO_ATTACH:-"disabled"}

# Erstelle die server.properties Datei
cat <<EOL > /bedrock/server.properties
server-name=${SERVER_NAME}
gamemode=${GAMEMODE}
force-gamemode=${FORCE_GAMEMODE}
difficulty=${DIFFICULTY}
allow-cheats=${ALLOW_CHEATS}
max-players=${MAX_PLAYERS}
online-mode=${ONLINE_MODE}
allow-list=${ALLOW_LIST}
server-port=${SERVER_PORT}
server-portv6=${SERVER_PORTV6}
enable-lan-visibility=${ENABLE_LAN_VISIBILITY}
view-distance=${VIEW_DISTANCE}
tick-distance=${TICK_DISTANCE}
player-idle-timeout=${PLAYER_IDLE_TIMEOUT}
max-threads=${MAX_THREADS}
level-name=${LEVEL_NAME}
level-seed=${LEVEL_SEED}
default-player-permission-level=${DEFAULT_PLAYER_PERMISSION_LEVEL}
texturepack-required=${TEXTUREPACK_REQUIRED}
content-log-file-enabled=${CONTENT_LOG_FILE_ENABLED}
compression-threshold=${COMPRESSION_THRESHOLD}
compression-algorithm=${COMPRESSION_ALGORITHM}
server-authoritative-movement=${SERVER_AUTHORITATIVE_MOVEMENT}
player-position-acceptance-threshold=${PLAYER_POSITION_ACCEPTANCE_THRESHOLD}
player-movement-action-direction-threshold=${PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHOLD}
server-authoritative-block-breaking-pick-range-scalar=${SERVER_AUTHORITATIVE_BLOCK_BREAKING_PICK_RANGE_SCALAR}
chat-restriction=${CHAT_RESTRICTION}
disable-player-interaction=${DISABLE_PLAYER_INTERACTION}
client-side-chunk-generation-enabled=${CLIENT_SIDE_CHUNK_GENERATION_ENABLED}
block-network-ids-are-hashes=${BLOCK_NETWORK_IDS_ARE_HASHES}
disable-persona=${DISABLE_PERSONA}
disable-custom-skins=${DISABLE_CUSTOM_SKINS}
server-build-radius-ratio=${SERVER_BUILD_RADIUS_RATIO}
allow-outbound-script-debugging=${ALLOW_OUTBOUND_SCRIPT_DEBUGGING}
allow-inbound-script-debugging=${ALLOW_INBOUND_SCRIPT_DEBUGGING}
script-debugger-auto-attach=${SCRIPT_DEBUGGER_AUTO_ATTACH}
EOL

# echo "server.properties generated:"
# cat /bedrock/server.properties


echo "Copying resource packs..."
rsync -a --ignore-existing /temp-config/resource_packs/ /bedrock/resource_packs/

echo "Copying behavior packs..."
rsync -a --ignore-existing /temp-config/behavior_packs/ /bedrock/behavior_packs/

mkdir -p /bedrock/worlds/${LEVEL_NAME}

echo "Overwriting world_behavior_packs.json and world_resource_packs.json to worlds/${LEVEL_NAME}/"
cp /temp-config/worlds/world_behavior_packs.json /bedrock/worlds/${LEVEL_NAME}/world_behavior_packs.json
cp /temp-config/worlds/world_resource_packs.json /bedrock/worlds/${LEVEL_NAME}/world_resource_packs.json

echo "Running bedrock_server..."
LD_LIBRARY_PATH=/bedrock /bedrock/bedrock_server
