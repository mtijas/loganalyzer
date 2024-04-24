#!/bin/sh

go install github.com/githubnemo/CompileDaemon@latest

CompileDaemon --build="go build -C ./logapp -o build/main main.go" --command="./logapp/build/main"
