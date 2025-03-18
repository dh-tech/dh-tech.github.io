FROM ghcr.io/hugomods/hugo:latest

WORKDIR /src

COPY . .

EXPOSE 1313

CMD ["server", "--bind", "0.0.0.0", "--port", "1313"]