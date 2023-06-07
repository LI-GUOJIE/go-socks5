package main

import (
	"ss5/socks5"
)

func main() {
	server, err := socks5.New(&socks5.Config{})
	if err != nil {
		panic(err)
	}

	// Create SOCKS5 proxy on localhost port 1080
	if err := server.ListenAndServe("tcp", "0.0.0.0:1080"); err != nil {
		panic(err)
	}
}
