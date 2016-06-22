@ECHO OFF

REM docker run --rm ^
REM -v C:\Users\robin\dev\dam:/go/src/github.com/chzmnky/dam ^
REM -w /go/src/github.com/chzmnky/dam ^
REM golang:1.6 ^
REM bash -c "go get github.com/Masterminds/glide && glide update"

docker run --rm ^
-v C:\Users\robin\dev\dam:/go/src/github.com/chzmnky/dam ^
-w /go/src/github.com/chzmnky/dam ^
golang:1.6 ^
bash -c make
