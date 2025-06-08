#!/bin/bash

# Install dependencies
npm install

# Compile TypeScript
npm run compile

# Package extension
npm run package

echo "Build completed. VSIX file is in the root directory."
