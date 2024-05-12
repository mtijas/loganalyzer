package loglist

import (
	"fmt"
	"net/http"
)

type LoglistHandler struct {}

func (h *LoglistHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "log")
}
