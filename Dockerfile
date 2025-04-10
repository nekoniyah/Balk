# Use Bun as the base image
FROM oven/bun:1

# Set environment variables
ENV NODE_ENV=production \
    MAIN_PORT=3000 \
    ADDITIONAL_PORTS="" \
    SERVER_MODE="app" \
    STARTUP_SCRIPT="bun run serve" \
    STATIC_DIR="public" \
    EGG=1 \
    SERVER_MEMORY=512 \
    SERVER_IP=0.0.0.0 \
    SERVER_PORT=3000

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN bun install

# Copy project files
COPY . .

# Create static directory if it doesn't exist
RUN mkdir -p ${STATIC_DIR}

# Expose main port
EXPOSE ${MAIN_PORT}

# Expose additional ports if specified
RUN if [ -n "$ADDITIONAL_PORTS" ]; then \
    for port in $(echo $ADDITIONAL_PORTS | tr ',' ' '); do \
    echo "EXPOSE $port" >> /tmp/ports; \
    done; \
    fi

# Command to run the server based on mode
CMD ["sh", "-c", "if [ \"$SERVER_MODE\" = \"static\" ]; then 'bun run serve'; else 'bun run ${STARTUP_SCRIPT}'; fi"] 