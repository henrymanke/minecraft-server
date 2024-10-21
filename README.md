# Minecraft Server Setup with Docker

## Table of Contents

1. [Description](#description)
2. [Quickstart](#quickstart)
3. [Usage](#usage)
   - [Configuration](#configuration)
   - [Customizing Server Settings](#customizing-server-settings)
4. [Troubleshooting](#troubleshooting)
5. [Modding Bedrock Server](#modding-bedrock-server)

## Description

This repository contains all the necessary files to set up and run a Minecraft server using Docker and Docker Compose. The main goal of this project is to provide an easy and straightforward way to deploy a **Minecraft Bedrock** server with minimal setup time.

> [!NOTE]  
> An example mod is also implemented in this repo - see config/resource_packs/

### Main Features:
- Quick deployment using Docker Compose
- Customizable server settings via `.env` and config files
- Pre-built initialization script for server preparation
- Flexibility to add mods and adjust server parameters

## Quickstart

### Prerequisites

Ensure you have the following software installed:
- **Docker**: To run the Minecraft server in a containerized environment.
- **Docker Compose**: To manage multi-container Docker applications easily.

### Quick Setup Steps

1. #### Clone the repository:

   ```bash
   git clone https://github.com/henrymanke/minecraft-server.git
   cd minecraft-server
   ```

2. #### Configure environment variables:

   Copy the `sample.env` file to `.env` and modify it as needed:

   ```bash
   cp sample.env .env
   ```

3. #### Build and start the server:

   ```bash
   docker compose up --build -d
   ```
   [:information_source:](docker_build_output.md)

4. #### Stop the server:

   ```bash
   docker compose down
   ```

## Usage

### Structure
    .
    ├── Dockerfile
    ├── README.md
    ├── config
    │   ├── allowlist.json
    │   ├── behavior_packs
    │   ├── permissions.json
    │   ├── resource_packs
    │   └── worlds
    │       ├── world_behavior_packs.json
    │       └── world_resource_packs.json
    ├── docker-compose.yml
    ├── init.sh
    ├── sample.env
    ├── update_bedrock.sh
    ├── .dockerignore
    └── .gitignore

### Configuration

The Minecraft server can be configured by modifying the `.env` file and files within the `config/` directory.

- **Server Port**: Modify the `SERVER_PORT` variable in the `.env` file to change the port on which the server will be accessible.
- **Memory Allocation**: Adjust the memory allocated to the server by changing the `MEMORY` variable in the `.env` file.
- **And Much More**: Check out the well documented [sample.env](sample.env) file!

### Customizing Server Settings

You can further tweak the server settings by:
- Editing the **.env** file located in the `root` directory to adjust game rules, difficulty level, and other Minecraft-specific settings.
- Modifying the **init.sh** script to add custom initialization logic before the server starts.

### Build Options

If you need to customize the Docker image or include additional dependencies, you can edit the `Dockerfile` to:
- Change the base image.
- Add custom packages.
- Configure the environment further to match your needs.

## Troubleshooting

If you encounter issues, here are some common checks:
- **Docker and Docker Compose are correctly installed and running.**
- **Ports defined in the `.env` file are not in use by other services.**
- **Adequate memory is allocated in your Docker setup for smooth server performance.**


To see detailed logs, use:

```bash
docker compose logs
```

## Modding Bedrock Server

For modding Bedrock servers, please refer to the [Bedrock protocol documentation](https://github.com/Mojang/bedrock-protocol-docs). Modifying server behavior can be done through custom configurations or additional plugins compatible with the Bedrock edition.
