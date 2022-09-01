#!/bin/sh

export $(grep -v '^#' .env | xargs)

# Or just ". .env"