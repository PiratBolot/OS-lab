#!/bin/bash

ps -u | tail -6 | head -1 | awk '{print $2}'

