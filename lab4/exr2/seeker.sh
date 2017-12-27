#!/bin/bash

at now + 2 minutes -f "$HOME/lab4/exr1/create.sh"
tail -n 0 -f "$HOME/report"
