package main

import (
	"fmt"
	"net/http"
	"log"

	loglist "github.com/mtijas/loganalyzer/logapp/loglist"
)

func main() {
	addr := "0.0.0.0"
	port := 8080
	fullServerAddr := fmt.Sprintf("%s:%d", addr, port)

	http.HandleFunc("GET /ping", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "pong")
	})

	http.Handle("GET /log", new(loglist.LoglistHandler))

	fmt.Printf("Starting the HTTP server at %s\n", fullServerAddr)
	log.Fatal(http.ListenAndServe(fullServerAddr, nil))
}
