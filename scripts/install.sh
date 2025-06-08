#!/bin/bash

# Get the latest release version
LATEST_RELEASE=$(curl -s https://api.github.com/repos/da-liu/otto-dl/releases/latest | grep "tag_name" | cut -d '"' -f 4)

# Download the VSIX file
curl -L -o otto-dl.vsix "https://github.com/da-liu/otto-dl/releases/download/${LATEST_RELEASE}/otto-dl-${LATEST_RELEASE}.vsix"

# Install the extension
code --install-extension otto-dl.vsix

echo "Extension installed successfully!"
