.PHONY: all monitor clean

REVISION := $(shell git rev-parse HEAD || unknown)
BUILTAT := $(shell date +%Y-%m-%dT%H:%M:%S)
GO_LDFLAGS ?= -s -X github.com/wesleywxie/traffic-monitor/pkg/versioninfo.REVISION=$(REVISION) \
              -X github.com/wesleywxie/traffic-monitor/pkg/versioninfo.BUILTAT=$(BUILTAT)
BINARY=monitor

all: monitor

monitor:
	mkdir -p bin
	go build -ldflags "$(GO_LDFLAGS)" -o ./bin/$(BINARY) ./src/main.go

# Clean up generated files
clean:
	rm -rf bin