# 🚀 GitHub Actions Power Demo

A comprehensive example showcasing the capabilities of GitHub Actions with real-world scenarios.

## What This Workflow Demonstrates

### 1. **Multi-Job Architecture**

- Parallel job execution for efficiency
- Job dependencies with `needs`
- Conditional job execution with `if`

### 2. **Matrix Testing**

```yaml
strategy:
  matrix:
    node-version: [18.x, 20.x]
    os: [ubuntu-latest, windows-latest]
```

- Tests across multiple Node versions and operating systems simultaneously
- Ensures compatibility and broad test coverage

### 3. **Workflow Triggers**

- **Push events** - On code push to main/develop branches
- **Pull requests** - For code review validation
- **Scheduled jobs** - Daily automated checks (cron syntax)
- **Manual trigger** - `workflow_dispatch` for on-demand runs
- **Event-based** - Triggered on specific events

### 4. **Artifact Management**

- Uploads generated documentation
- Caches dependencies (npm modules) for faster runs
- Artifact retention and retrieval

### 5. **Container Integration**

- Docker image building
- Container registry push (GHCR - GitHub Container Registry)
- Layer caching for faster builds

### 6. **Security & Code Quality**

- Dependency caching for performance
- Linting and testing
- Vulnerability scanning with Trivy
- SARIF report upload for GitHub Security tab

### 7. **Notifications & Reporting**

- Job status tracking
- GitHub Step Summary generation
- Slack integration for failures
- Conditional notifications

### 8. **Advanced Features**

- Environment variables (`env`)
- Secrets management (`secrets.`)
- Permissions management (least privilege principle)
- `continue-on-error` for non-blocking steps
- Outputs and step IDs for data passing

## Key GitHub Actions Concepts

### Environment Variables

```yaml
env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}
```

### Context Variables

- `${{ github.ref }}` - Branch/tag reference
- `${{ github.actor }}` - User who triggered workflow
- `${{ github.event_name }}` - Type of event
- `${{ github.repository }}` - Full repo name

### Conditional Execution

```yaml
if: github.event_name == 'push' && github.ref == 'refs/heads/main'
```

### Job Outputs & Dependencies

```yaml
needs: [quality-checks, security-scan]
```

## Running Locally with act

Test the workflow locally before pushing:

```bash
# Install act
choco install act-cli  # Windows with Chocolatey
# or
brew install act       # macOS

# Run specific job
act -j quality-checks

# List available jobs
act -l

# Run with specific GitHub event
act push
act pull_request
```

## Setup Requirements

### Secrets (if using notifications)

Add these to your repository settings:

- `SLACK_WEBHOOK` - For Slack notifications

### Permissions

The workflow respects GitHub's permission model:

- `contents: read` - Read repository content
- `checks: write` - Write check results
- `security-events: write` - Upload security reports
- `packages: write` - Push to container registry

## Workflow File Structure

```
.github/
└── workflows/
    └── action2-example.yml
```

## Real-World Applications

This workflow template can be adapted for:

- **CI/CD Pipelines** - Build, test, deploy
- **Release Automation** - Build and publish releases
- **Security Scanning** - Automated vulnerability detection
- **Documentation** - Auto-generate and deploy docs
- **Notifications** - Slack/Teams alerts
- **Multi-platform Testing** - Test across OS/architecture
- **Container Deployment** - Build and push images

## Best Practices Demonstrated

✅ Matrix strategy for broad test coverage
✅ Caching for performance optimization
✅ Conditional execution to save resources
✅ Proper permission scoping
✅ Error handling with `continue-on-error`
✅ Artifact preservation
✅ Job dependency management
✅ Clear step naming for readability
✅ Security scanning integration
✅ Comprehensive reporting

## Next Steps

1. Customize for your project needs
2. Add required secrets
3. Update job conditions based on your workflow
4. Test locally with `act`
5. Push and monitor the GitHub Actions tab

## Resources

- [GitHub Actions Documentation](https://docs.github.com/actions)
- [Workflow Syntax](https://docs.github.com/actions/using-workflows/workflow-syntax-for-github-actions)
- [act - Run GitHub Actions locally](https://github.com/nektos/act)
