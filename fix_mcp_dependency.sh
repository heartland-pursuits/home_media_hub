#!/bin/bash
set -e

echo "Installing uv (required for MCP servers)..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Installation complete."
echo "Please restart your shell or source the environment to use 'uvx'."
