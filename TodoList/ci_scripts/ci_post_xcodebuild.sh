#!/bin/sh

# This runs after xcodebuild completes successfully

# Set build metadata
if [ "$CI_XCODEBUILD_ACTION" = "archive" ]; then
    echo "Setting TestFlight metadata..."
    
    # You can set these as environment variables in your workflow
    # or hardcode them here
    export TESTFLIGHT_WHAT_TO_TEST="
## What's New in This Build

- Bug fixes and performance improvements

## Known Issues
- Kalo tap button -> crash
"
fi
