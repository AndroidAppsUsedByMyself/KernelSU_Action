#!/usr/bin/env bash
find .github/workflows/* -exec diff .github/workflows/build-kernel.yml {} \;