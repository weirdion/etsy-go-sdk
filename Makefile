# Variables
OPENAPI_URL=https://www.etsy.com/openapi/generated/oas/3.0.0.json
OPENAPI_FILE=openapi/etsy-openapi.json
SDK_DIR=sdk

# Default target
all: generate

# Download the OpenAPI spec
$(OPENAPI_FILE):
	mkdir -p openapi
	curl -sSL $(OPENAPI_URL) -o $(OPENAPI_FILE)

# Generate the SDK
generate: $(OPENAPI_FILE)
	mkdir -p $(SDK_DIR)
	ogen --target $(SDK_DIR) --package sdk $(OPENAPI_FILE)

# Clean up generated files
clean:
	rm -rf $(SDK_DIR) $(OPENAPI_FILE)

# Phony targets
.PHONY: all generate clean