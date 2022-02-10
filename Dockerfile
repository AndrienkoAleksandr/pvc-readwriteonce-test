FROM registry.access.redhat.com/ubi8/go-toolset@sha256:2d56a94f1e83fe0e874f099dd8d03b876186985a7dbeea118e8c725b1b07b9f0 as builder

USER root

RUN mkdir -p /application

WORKDIR /application

COPY main.go /application/main.go

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -mod=vendor -a -o folder-content-reader main.go

FROM registry.access.redhat.com/ubi8-minimal:8.5-230

COPY --from=builder /application/folder-content-reader /application/folder-content-reader

ENTRYPOINT [ "/application/folder-content-reader" ]
