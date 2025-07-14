# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a DevContainer configuration repository that sets up a development environment with Claude Code and Node.js integration. The environment is based on Python 3.12 slim Docker image.

## Key Configuration Files

- **devcontainer.json**: Main configuration for the DevContainer
  - Note: There are two versions in different locations:
    - Root version
    - `.devcontainer/` version (preferred by VSCode)
  - Both use the same default user: `dev_user`
- **Dockerfile**: Creates the container with Python 3.12-slim and configurable user setup
- **changebash.sh**: Script that sets up custom bash prompt with Git branch display (uses $HOME for portability)
- **.bashrc**: Custom bash configuration with Git-aware prompt

## Development Environment Setup

The container is configured with:
- Python 3.12 slim base image
- Node.js (via DevContainer features)
- Claude Code integration (via DevContainer features)
- Custom user with sudo privileges
- Git-aware bash prompt showing current branch

## Language Preference

Based on the GitHub Copilot instructions, responses should be provided in Japanese when appropriate.

## Claude Code Permissions

The `.claude/settings.local.json` file allows the following bash commands:
- `find` command
- `tree` command

## Post-Create Setup

After container creation, the `changebash.sh` script runs automatically to:
1. Copy the custom bashrc configuration
2. Apply Git-aware prompt customization

## Important Notes

- This is a DevContainer setup repository, not an application codebase
- The custom bash prompt displays the current Git branch when in a Git repository
- The environment uses portable configuration with environment variables and $HOME references
- Default user is `dev_user` but can be customized via build args in devcontainer.json