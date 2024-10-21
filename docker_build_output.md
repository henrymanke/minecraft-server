# Output of the build process

#### Further information can be found in the [README.md](README.md#build-and-start-the-server).

If you execute the command `docker compose up --build`, you will see the following output (or similar, depending on your configuration):


``` bash
user@machine minecraft-server % docker compose up --build
[+] Building 1.0s (13/13) FINISHED                                                                                                                                                                         docker:desktop-linux
 => [mc-server internal] load build definition from Dockerfile                                                                                                                                                             0.0s
 => => transferring dockerfile: 1.17kB                                                                                                                                                                                     0.0s
 => [mc-server internal] load metadata for docker.io/library/ubuntu:20.04                                                                                                                                                  0.9s
 => [mc-server internal] load .dockerignore                                                                                                                                                                                0.0s
 => => transferring context: 257B                                                                                                                                                                                          0.0s
 => [mc-server 1/7] FROM docker.io/library/ubuntu:20.04@sha256:8e5c4f0285ecbb4ead070431d29b576a530d3166df73ec44affc1cd27555141b                                                                                            0.0s
 => [mc-server internal] load build context                                                                                                                                                                                0.0s
 => => transferring context: 66B                                                                                                                                                                                           0.0s
 => CACHED [mc-server 2/7] RUN apt-get update &&     apt-get install -y unzip curl libc6 libcurl4 cron rsync &&     rm -rf /var/lib/apt/lists/*                                                                            0.0s
 => CACHED [mc-server 3/7] WORKDIR /bedrock                                                                                                                                                                                0.0s
 => CACHED [mc-server 4/7] COPY update_bedrock.sh .                                                                                                                                                                        0.0s
 => CACHED [mc-server 5/7] RUN chmod +x ./update_bedrock.sh &&     echo "0 0 * * * /bedrock/update_bedrock.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/bedrock_update &&     chmod 0644 /etc/cron.d/bedrock_update &&      0.0s
 => CACHED [mc-server 6/7] COPY init.sh .                                                                                                                                                                                  0.0s
 => CACHED [mc-server 7/7] RUN chmod +x init.sh                                                                                                                                                                            0.0s
 => [mc-server] exporting to image                                                                                                                                                                                         0.0s
 => => exporting layers                                                                                                                                                                                                    0.0s
 => => writing image sha256:367230ca68b67cdc59ed67146f0993b6b134553da22a56d04afc6ed4e7614806                                                                                                                               0.0s
 => => naming to docker.io/library/minecraft-server-mc-server                                                                                                                                                              0.0s
 => [mc-server] resolving provenance for metadata file                                                                                                                                                                     0.0s
[+] Running 3/3
 ✔ Network minecraft-server_default        Created                                                                                                                                                                         0.0s 
 ✔ Volume "minecraft-server_bedrock_data"  Created                                                                                                                                                                         0.0s 
 ✔ Container minecraft_bedrock_server      Created                                                                                                                                                                         0.6s 
Attaching to minecraft_bedrock_server
minecraft_bedrock_server  | Generate server.properties based on the environment variables...
minecraft_bedrock_server  | Copying resource packs...
minecraft_bedrock_server  | Copying behavior packs...
minecraft_bedrock_server  | Overwriting world_behavior_packs.json and world_resource_packs.json to worlds/my_world/
minecraft_bedrock_server  | Running bedrock_server...
minecraft_bedrock_server  | NO LOG FILE! - setting up server logging...
minecraft_bedrock_server  | [2024-10-21 12:44:26:790 INFO] Starting Server
minecraft_bedrock_server  | [2024-10-21 12:44:26:790 INFO] Version: 1.21.31.04
minecraft_bedrock_server  | [2024-10-21 12:44:26:790 INFO] Session ID: f9383acf-da97-4501-b4f7-6890e96b5418
minecraft_bedrock_server  | [2024-10-21 12:44:26:790 INFO] Build ID: 28097911
minecraft_bedrock_server  | [2024-10-21 12:44:26:790 INFO] Branch: r/21_u3
minecraft_bedrock_server  | [2024-10-21 12:44:26:790 INFO] Commit ID: ed5a9873836799e852e0af15f9bdbec75560efe3
minecraft_bedrock_server  | [2024-10-21 12:44:26:790 INFO] Configuration: Publish
minecraft_bedrock_server  | [2024-10-21 12:44:26:794 INFO] Level Name: my_world
minecraft_bedrock_server  | [2024-10-21 12:44:26:797 INFO] No CDN config file found for dedicated server
minecraft_bedrock_server  | [2024-10-21 12:44:26:797 INFO] Game mode: 0 Survival
minecraft_bedrock_server  | [2024-10-21 12:44:26:797 INFO] Difficulty: 1 EASY
minecraft_bedrock_server  | [2024-10-21 12:44:26:808 INFO] Content logging to console is enabled.
minecraft_bedrock_server  | [2024-10-21 12:44:27:236 INFO] Content logging to disk is enabled. Writing log to: ContentLog2024-10-21_12-44-27
minecraft_bedrock_server  | [2024-10-21 12:44:27:244 INFO] Opening level 'worlds/my_world/db'
minecraft_bedrock_server  | [2024-10-21 12:44:27:488 INFO] [SERVER] Pack Stack - None
minecraft_bedrock_server  | [2024-10-21 12:44:29:007 INFO] IPv4 supported, port: 8888: Used for gameplay
minecraft_bedrock_server  | [2024-10-21 12:44:29:007 INFO] IPv6 supported, port: 8889: Used for gameplay
minecraft_bedrock_server  | [2024-10-21 12:44:29:051 INFO] Server started.
minecraft_bedrock_server  | [2024-10-21 12:44:29:053 INFO] ================ TELEMETRY MESSAGE ===================
minecraft_bedrock_server  | [2024-10-21 12:44:29:053 INFO] Server Telemetry is currently not enabled. 
minecraft_bedrock_server  | [2024-10-21 12:44:29:053 INFO] Enabling this telemetry helps us improve the game.
minecraft_bedrock_server  | [2024-10-21 12:44:29:053 INFO] 
minecraft_bedrock_server  | [2024-10-21 12:44:29:053 INFO] To enable this feature, add the line 'emit-server-telemetry=true'
minecraft_bedrock_server  | [2024-10-21 12:44:29:053 INFO] to the server.properties file in the handheld/src-server directory
minecraft_bedrock_server  | [2024-10-21 12:44:29:053 INFO] ======================================================
minecraft_bedrock_server  | [2024-10-21 12:44:29:058 INFO] [Scripting] No script plugins found.
minecraft_bedrock_server  | 


v View in Docker Desktop   o View Config   w Enable Watch
```