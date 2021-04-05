#!/bin/sh

cd ../CLI
SWIFT="/usr/bin/xcrun --sdk macosx swift"

$SWIFT build
$SWIFT run cli format ../
