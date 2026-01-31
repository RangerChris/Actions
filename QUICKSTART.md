# Quick Start Guide: Testing Your GitHub Actions Workflow

## Local Testing with act

### Installation

```powershell
# Windows with Chocolatey
choco install act-cli

# Verify installation
act --version
```

### List Available Jobs

```powershell
cd d:\projects\Actions
act -l
```

Output shows:

```
Job ID              | Job Name                | Workflow Name           | Workflow File
quality-checks      | Code Quality & Tests    | GitHub Actions Power... | action2-example.yml
security-scan       | Security Analysis       | GitHub Actions Power... | action2-example.yml
docs                | Generate Documentation  | GitHub Actions Power... | action2-example.yml
container           | Build & Push Container  | GitHub Actions Power... | action2-example.yml
notify              | Notifications           | GitHub Actions Power... | action2-example.yml
```

### Run Specific Job Locally

```powershell
# Run the quality checks job
act -j quality-checks

# Run security scanning
act -j security-scan

# Run all jobs
act
```

### Debug Issues

```powershell
# Verbose output
act -v -j quality-checks

# Run specific event
act push -j quality-checks

# Run pull_request event
act pull_request -j quality-checks
```

## PowerShell Examples

### Test the workflow triggers

```powershell
# Navigate to project
cd d:\projects\Actions

# Check workflow syntax
act -l

# Run on push event
act push

# Run on schedule event
act schedule

# Run on manual trigger (workflow_dispatch)
act workflow_dispatch
```

## Customizing for Your Project

### 1. Update Node Version

Edit `.github\workflows\action2-example.yml`:

```yaml
node-version: [18.x, 20.x, 21.x]  # Add version as needed
```

### 2. Update Build Scripts

Edit `package.json`:

```json
{
  "scripts": {
    "build": "your-build-command",
    "lint": "your-linter-command",
    "test": "your-test-command"
  }
}
```

### 3. Add Secrets (for production)

In GitHub Settings → Secrets and Variables → Actions:

- `SLACK_WEBHOOK` - for Slack notifications
- `DOCKER_USERNAME` - for Docker Hub
- `DOCKER_PASSWORD` - for Docker Hub

### 4. Configure Container Registry

Update the registry in workflow:

```yaml
env:
  REGISTRY: docker.io  # Docker Hub
  # or
  REGISTRY: ghcr.io    # GitHub Container Registry
```

## Common Commands

```powershell
# Setup Node.js tools
act -j quality-checks -P ubuntu-latest=ghcr.io/catthehacker/ubuntu:full-latest

# Run with specific runner image
act -P ubuntu-latest=ghcr.io/catthehacker/ubuntu:full-latest

# See all available options
act --help
```

## Debugging Tips

### If act fails with Docker

```powershell
# Install Docker Desktop for Windows
# Or use WSL2 backend with Docker

# Verify Docker is running
docker ps
```

### Common Issues

1. **Node modules not found** - Run: `npm install`
2. **Permission denied** - Run PowerShell as Administrator
3. **Docker not found** - Install Docker Desktop

## Next Steps

1. Push to GitHub to test on actual runners
2. Monitor workflow runs at: `https://github.com/YOUR_USERNAME/Actions/actions`
3. Add more jobs for your specific needs
4. Set up notifications and deployments
5. Create branch protection rules requiring workflow checks

## Useful Links

- Act GitHub: <https://github.com/nektos/act>
- GitHub Actions Docs: <https://docs.github.com/actions>
- Act Docker Images: <https://github.com/catthehacker/docker_images>
