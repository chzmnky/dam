package main

import (
	"fmt"
	"os"

	"github.com/chzmnky/dam/cmd/dam/cmds"
)

func main() {
	if err := cmds.RootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(-1)
	}
}
