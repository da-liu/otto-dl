#!/bin/bash

LATEST_RELEASE=$(curl -s https://api.github.com/repos/da-liu/otto-dl/releases/latest | grep "tag_name" | cut -d '"' -f 4)

if [ -z "$LATEST_RELEASE" ]; then
  echo "Error: Could not retrieve the latest release version."
  exit 1
fi

VSIX_FILENAME="otto-dl.vsix"

echo "Downloading ${VSIX_FILENAME} from release ${LATEST_RELEASE}..."
curl -L -f -o otto-dl.vsix "https://github.com/da-liu/otto-dl/releases/download/${LATEST_RELEASE}/${VSIX_FILENAME}"

if [ -f "${VSIX_FILENAME}" ]; then
  echo "Installing ${VSIX_FILENAME} into VS Code..."
  code --install-extension "${VSIX_FILENAME}"
  echo "Cleaning up..."
  rm "${VSIX_FILENAME}"
else
  echo "Error: Download failed, ${VSIX_FILENAME} not found."
  exit 1
fi

echo "Installation complete."
