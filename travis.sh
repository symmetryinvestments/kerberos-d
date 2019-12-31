#!/bin/bash

set -euxo pipefail
dub build --compiler=${DC} --vverbose
