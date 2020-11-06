VERSION ?= $(shell git describe --tags --abbrev=0 2>/dev/null)
REVISION ?= $(shell git rev-parse --short HEAD 2>/dev/null)

GO_LDFLAGS := -X github.com/kawakattsun/codebuild-go-modules-sample-private/version.version=$(VERSION)
GO_LDFLAGS += -X github.com/kawakattsun/codebuild-go-modules-sample-private/version.revision=$(REVISION)

all: bin/codebuild-go-modules-sample

bin/codebuild-go-modules-sample: *.go
	go build -trimpath -ldflags '$(GO_LDFLAGS)' -o $@ .
