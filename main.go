package main

import (
	"ss5/socks5"
)

func main() {

	// // Create a socks server
	// creds := socks5.StaticCredentials{
	// 	"egg": "change_to_what_you_like",
	// }
	// cator := socks5.UserPassAuthenticator{Credentials: creds}
	// conf := &socks5.Config{
	// 	AuthMethods: []socks5.Authenticator{cator},
	// 	Logger:      log.New(os.Stdout, "", log.LstdFlags),
	// }
	conf := &socks5.Config{}
	server, err := socks5.New(conf)
	if err != nil {
		panic(err)
	}

	// Create SOCKS5 proxy on localhost port 23333
	if err := server.ListenAndServe("tcp", "0.0.0.0:23333"); err != nil {
		panic(err)
	}
}
