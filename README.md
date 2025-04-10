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

# Run the container
docker run -p 3000:3000 balk
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

## License

MIT License - See LICENSE file for details
