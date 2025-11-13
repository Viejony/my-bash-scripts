#!/bin/zsh
# or use #!/bin/bash if you prefer bash

# Exit if any command fails
set -e

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "❌ Usage: $0 <path_to_aab>"
  exit 1
fi

# Input AAB file (argument 1)
AAB_FILE="$1"

# Output file name (always the same)
OUTPUT_APKS="output.apks"

echo "📦 Building APKs from: $AAB_FILE"
bundletool build-apks --bundle="$AAB_FILE" --output="$OUTPUT_APKS"

echo "📲 Installing APKs..."
bundletool install-apks --apks="$OUTPUT_APKS"

echo "🧹 Cleaning up..."
rm "$OUTPUT_APKS"

echo "✅ Done!"

