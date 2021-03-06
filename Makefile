default: install

build-libgit2:
	./script/build-libgit2-static.sh

test: build-libgit2
	go run script/check-MakeGitError-thread-lock.go
	./script/with-static.sh go test ./...

install: test
	./script/with-static.sh go install ./...
