package cmds

import (
	"fmt"

	"github.com/spf13/cobra"

	"github.com/chzmnky/dam/version"
)

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Display version details.",
	Run:   versionCmdRun,
}

func versionCmdRun(cmd *cobra.Command, args []string) {
	fmt.Printf("%s\n%s\n", RootCmd.Short, version.DAMVersion)
}

func init() {
	RootCmd.AddCommand(versionCmd)
}
