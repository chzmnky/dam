package version

import "fmt"

// Version represents the current application version.
type Version struct {
	Major int
	Minor int
	Patch int
	Build string
}

var (
	// Build is the current Git revision SHA
	Build string

	// DAMVersion is the current application version.
	DAMVersion = Version{Major: 0, Minor: 0, Patch: 0, Build: Build}
)

func (v *Version) String() string {
	return fmt.Sprintf(
		"Version: %v.%v.%v\nBuild:   %s\n",
		v.Major,
		v.Minor,
		v.Patch,
		v.Build,
	)
}
