PROJECT_NAME = "otakuverse-api"

all: build

build: dependencies
	CGO_ENABLED=0 GOOS=linux go build -ldflags "-d -s" -installsuffix cgo

clean:
	@rm -f $(PROJECT_NAME)

fclean: clean

re: fclean build

test:
	go test ./...

dependencies:
	@go mod tidy
	@go mod download
	@go install golang.org/x/lint/golint@v0.0.0-20210508222113-6edffad5e616
	@go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@v2.4.1

openapi-swagger:
	bash ./scripts/openapi_swagger.sh
