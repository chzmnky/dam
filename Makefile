PREFIX=github.com/chzmnky/dam
VERSION_PKG=github.com/chzmnky/dam/version
BUILD_SHA=$(shell git rev-parse HEAD)

ifeq "$(UNAME)" "Darwin"
	# Add -s flag to prevent codesigning issues on macOS
	BUILD_FLAGS=-ldflags="-s -X $(VERSION_PKG).Build=$(BUILD_SHA)"
else
	BUILD_FLAGS=-ldflags="-X $(VERSION_PKG).Build=$(BUILD_SHA)"
endif

# Workaround for GO15VENDOREXPERIMENT bug (https://github.com/golang/go/issues/11659)
ALL_PACKAGES=$(shell go list ./... | grep -v /vendor | grep -v /scripts)


default: validate build

# validate: lint test
validate: test

# build: build_darwin build_linux build_windows
build: build_darwin

darwin: build_darwin

build_darwin:
	@echo "Building Darwin..."
	@GOOS=darwin go build $(BUILD_FLAGS) $(PREFIX)/cmd/dam
	@GOOS=darwin go build $(BUILD_FLAGS) $(PREFIX)/cmd/dam-run

linux: build_linux

build_linux:
	@echo "Building Linux..."
	@GOOS=linux go build $(BUILD_FLAGS) $(PREFIX)/cmd/dam
	@GOOS=linux go build $(BUILD_FLAGS) $(PREFIX)/cmd/dam-run

windows: build_windows

build_windows:
	@echo "Building Windows..."
	@GOOS=windows go build $(BUILD_FLAGS) $(PREFIX)/cmd/dam
	@GOOS=windows go build $(BUILD_FLAGS) $(PREFIX)/cmd/dam-run

install:
	@echo "Installing..."
	@go install $(BUILD_FLAGS) $(PREFIX)/cmd/dam
	@go install $(BUILD_FLAGS) $(PREFIX)/cmd/dam-run

lint:
	@echo "Linting..."
	@golint $(PREFIX)/cmd/dam
	@golint $(PREFIX)/cmd/dam/cmds
	@golint $(PREFIX)/cmd/dam-run
	@golint $(PREFIX)/cmd/dam-run/cmds
	@golint $(PREFIX)/docker
	@golint $(PREFIX)/upgrader
	@golint $(PREFIX)/version

	@# while read -r line; do
	@# 	# golint $line
	@# done <<< "$ALL_PACKAGES"

test:
	@echo "Testing..."
	@go test $(TEST_FLAGS) $(BUILD_FLAGS) $(ALL_PACKAGES)
