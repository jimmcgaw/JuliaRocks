FROM julia:1.11

RUN apt-get update

WORKDIR /app

COPY src/ /app/src/
COPY Project.toml /app/

RUN julia --project=. -e "import Pkg; Pkg.instantiate()"

EXPOSE 9090

CMD ["julia", "src/sockets.jl"]