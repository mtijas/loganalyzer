#!/bin/sh

go install github.com/githubnemo/CompileDaemon@latest

CompileDaemon --build="go build -C ./logapp -o build ..." --command="./logapp/build/logapp"
