# Output of the build process

#### Further information can be found in the [README.md](README.md#build-and-start-the-server).

If you execute the command `docker compose up --build`, you will see the following output (or similar, depending on your configuration):


``` bash
user@machine minecraft-server % docker compose up --build
[+] Building 0.7s (14/14) FINISHED                                                                                                                         docker:desktop-linux
 => [mc-server internal] load build definition from Dockerfile                                                                                                             0.0s
 => => transferring dockerfile: 1.13kB                                                                                                                                     0.0s
 => [mc-server internal] load metadata for docker.io/library/ubuntu:20.04                                                                                                  0.5s
 => [mc-server internal] load .dockerignore                                                                                                                                0.0s
 => => transferring context: 166B                                                                                                                                          0.0s
 => [mc-server 1/8] FROM docker.io/library/ubuntu:20.04@sha256:6d8d9799fe6ab3221965efac00b4c34a2bcc102c086a58dff9e19a08b913c7ef                                            0.0s
 => [mc-server internal] load build context                                                                                                                                0.1s
 => => transferring context: 127.05kB                                                                                                                                      0.0s
 => CACHED [mc-server 2/8] RUN apt-get update &&     apt-get install -y unzip curl libc6 libcurl4 cron &&     rm -rf /var/lib/apt/lists/*                                  0.0s
 => CACHED [mc-server 3/8] WORKDIR /bedrock                                                                                                                                0.0s
 => CACHED [mc-server 4/8] COPY update_bedrock.sh .                                                                                                                        0.0s
 => CACHED [mc-server 5/8] RUN chmod +x ./update_bedrock.sh && echo "0 0 * * * /bedrock/update_bedrock.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/bedrock_update && chmo  0.0s
 => CACHED [mc-server 6/8] COPY init.sh .                                                                                                                                  0.0s
 => CACHED [mc-server 7/8] RUN chmod +x init.sh                                                                                                                            0.0s
 => CACHED [mc-server 8/8] COPY config/* ./                                                                                                                                0.0s
 => [mc-server] exporting to image                                                                                                                                         0.0s
 => => exporting layers                                                                                                                                                    0.0s
 => => writing image sha256:8b4cf1ec7c32bc3ae56992ef585799459a3a227310b44964694bc7b1c794a0b4                                                                               0.0s
 => => naming to docker.io/library/minecraft-server-mc-server                                                                                                              0.0s
 => [mc-server] resolving provenance for metadata file                                                                                                                     0.0s
[+] Running 2/1
 ✔ Network minecraft-server_default    Created                                                                                                                             0.0s 
 ✔ Container minecraft_bedrock_server  Created                                                                                                                             0.0s 
Attaching to minecraft_bedrock_server
minecraft_bedrock_server  | Generate server.properties based on the environment variables...
minecraft_bedrock_server  | Running bedrock_server...
minecraft_bedrock_server  | -rwxrwxr-x 1 root root 152697336 Sep 26 00:54 ./bedrock_server
minecraft_bedrock_server  | NO LOG FILE! - setting up server logging...
minecraft_bedrock_server  | [2024-10-08 07:29:53:631 INFO] Starting Server
minecraft_bedrock_server  | [2024-10-08 07:29:53:631 INFO] Version: 1.21.31.04
minecraft_bedrock_server  | [2024-10-08 07:29:53:631 INFO] Session ID: 37c94629-73d2-4f15-92be-94cd7b08e167
minecraft_bedrock_server  | [2024-10-08 07:29:53:631 INFO] Build ID: 28097911
minecraft_bedrock_server  | [2024-10-08 07:29:53:631 INFO] Branch: r/21_u3
minecraft_bedrock_server  | [2024-10-08 07:29:53:631 INFO] Commit ID: ed5a9873836799e852e0af15f9bdbec75560efe3
minecraft_bedrock_server  | [2024-10-08 07:29:53:631 INFO] Configuration: Publish
minecraft_bedrock_server  | [2024-10-08 07:29:53:636 INFO] Level Name: my_world
minecraft_bedrock_server  | [2024-10-08 07:29:53:639 INFO] No CDN config file found for dedicated server
minecraft_bedrock_server  | [2024-10-08 07:29:53:640 INFO] Game mode: 0 Survival
minecraft_bedrock_server  | [2024-10-08 07:29:53:640 INFO] Difficulty: 1 EASY
minecraft_bedrock_server  | [2024-10-08 07:29:53:651 INFO] Content logging to console is enabled.
minecraft_bedrock_server  | [2024-10-08 07:29:54:140 INFO] Content logging to disk is enabled. Writing log to: ContentLog2024-10-08_07-29-54
minecraft_bedrock_server  | [2024-10-08 07:29:54:150 INFO] Opening level 'worlds/my_world/db'
minecraft_bedrock_server  | [2024-10-08 07:29:54:414 INFO] [SERVER] Pack Stack - None
minecraft_bedrock_server  | [2024-10-08 07:29:56:024 INFO] IPv4 supported, port: 8888: Used for gameplay
minecraft_bedrock_server  | [2024-10-08 07:29:56:024 INFO] IPv6 supported, port: 8889: Used for gameplay
minecraft_bedrock_server  | [2024-10-08 07:29:56:067 INFO] Server started.
minecraft_bedrock_server  | [2024-10-08 07:29:56:068 INFO] ================ TELEMETRY MESSAGE ===================
minecraft_bedrock_server  | [2024-10-08 07:29:56:068 INFO] Server Telemetry is currently not enabled. 
minecraft_bedrock_server  | [2024-10-08 07:29:56:068 INFO] Enabling this telemetry helps us improve the game.
minecraft_bedrock_server  | [2024-10-08 07:29:56:068 INFO] 
minecraft_bedrock_server  | [2024-10-08 07:29:56:068 INFO] To enable this feature, add the line 'emit-server-telemetry=true'
minecraft_bedrock_server  | [2024-10-08 07:29:56:068 INFO] to the server.properties file in the handheld/src-server directory
minecraft_bedrock_server  | [2024-10-08 07:29:56:068 INFO] ======================================================
minecraft_bedrock_server  | [2024-10-08 07:29:56:074 INFO] [Scripting] No script plugins found.
minecraft_bedrock_server  | 


v View in Docker Desktop   o View Config   w Enable Watch
```