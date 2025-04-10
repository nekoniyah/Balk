# Balk

A versatile Bun server runtime environment with static file serving support, designed for Pterodactyl panel integration.

## Features

-   🚀 Bun runtime environment
-   📁 Static file serving support
-   🔄 Bun application support
-   🔌 Multiple port configuration
-   🎮 Pterodactyl panel integration
-   ⚙️ Customizable environment variables

## Configuration

### Environment Variables

| Variable           | Description                                  | Default  | Required |
| ------------------ | -------------------------------------------- | -------- | -------- |
| `SERVER_MODE`      | Server mode (static or app)                  | `app`    | Yes      |
| `MAIN_PORT`        | Main port to run the server on               | `3000`   | Yes      |
| `ADDITIONAL_PORTS` | Additional ports to expose (comma-separated) | `""`     | No       |
| `SERVER_MEMORY`    | Memory limit for the server                  | `512`    | Yes      |
| `STARTUP_SCRIPT`   | Script to run in app mode                    | `start`  | Yes      |
| `STATIC_DIR`       | Directory for static files                   | `public` | Yes      |

### Modes

#### Static File Mode

-   Set `SERVER_MODE=static`
-   Files are served from the specified `STATIC_DIR`
-   Supports all static file types

#### Application Mode

-   Set `SERVER_MODE=app`
-   Runs any Bun application
-   Uses the specified `STARTUP_SCRIPT`

## Usage

### Docker

```bash
# Build the image
docker build -t balk .

# Run the container (accessible from any network interface)
docker run -p 0.0.0.0:3000:3000 balk
```

### Pterodactyl

1. Upload the egg configuration to your Pterodactyl panel
2. Create a new server using the Balk egg
3. Configure the environment variables as needed
4. Start the server

## Development

### Project Structure

```
balk/
├── Dockerfile          # Docker configuration
├── egg.json           # Pterodactyl egg configuration
├── serve.ts           # Static file server
└── package.json       # Project dependencies
```

### Building

```bash
# Install dependencies
bun install

# Run in development mode
bun run dev
```

## Troubleshooting

### Connection Issues

If you can't access the server with IP and port, check the following:

1. **Firewall Settings**:

    - Ensure the port is open in your firewall
    - For Docker: `sudo ufw allow 3000`
    - For Pterodactyl: Check your server's firewall rules

2. **Docker Network**:

    - Use `0.0.0.0` as the host IP: `docker run -p 0.0.0.0:3000:3000 balk`
    - Check if the container is running: `docker ps`
    - Check container logs: `docker logs <container_id>`

3. **Pterodactyl Specific**:

    - Verify the server is running in the panel
    - Check the server's allocation settings
    - Ensure the port is properly allocated in Pterodactyl

4. **Application Configuration**:

    - Make sure your application is binding to `0.0.0.0` and not just `localhost`
    - Verify the correct port is being used in your application
    - Check if the application is actually listening on the port

5. **Network Configuration**:
    - Try accessing via `localhost` or `127.0.0.1` first
    - If using a VPS, ensure the IP is correct
    - Check if the port is being used by another service

### Common Solutions

1. **For Docker**:

    ```bash
    # Check if port is in use
    sudo lsof -i :3000

    # Check container network
    docker inspect <container_id>
    ```

2. **For Pterodactyl**:
    - Check the server's network settings in the panel
    - Verify the allocation is correct
    - Check the server's console for any errors

## License

MIT License - See LICENSE file for details
