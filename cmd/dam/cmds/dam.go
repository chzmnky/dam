package cmds

import (
	"github.com/spf13/cobra"

	// For testing purposes only
	_ "gopkg.in/yaml.v2"

	// _ "github.com/Sirupsen/logrus"
	_ "github.com/docker/engine-api/client"
	_ "github.com/docker/engine-api/types"
	_ "golang.org/x/net/context"
)

var (
	// Debug is whether verbose logging is enabled.
	Debug bool
)

const damCmdLongDesc = `Dockerized Application Mapper.

Dam allows you to map the applications within any docker container to a local alias,
using a configuration file.  This will allow the application to act like a natively
installed version, presenting the same commandline API as the actual program.
`

// RootCmd is the root for the dam command.
var RootCmd = &cobra.Command{
	Use:   "dam",
	Short: "Dockerized Application Mapper",
	Long:  damCmdLongDesc,
}

func init() {
	RootCmd.PersistentFlags().BoolVarP(&Debug, "debug", "d", false, "Enable verbose output.")
}
