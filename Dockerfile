# Multi-stage build example
FROM node:20-alpine AS builder

WORKDIR /app

# Copy project files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Build application
COPY . .
RUN npm run build

# Runtime stage
FROM node:20-alpine

WORKDIR /app

# Copy built application from builder
COPY --from=builder /app .

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD node -e "require('http').get('http://localhost:3000', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Expose port
EXPOSE 3000

# Start application
CMD ["node", "index.js"]
