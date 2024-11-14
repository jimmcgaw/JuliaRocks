# Hello World HTTP Server with Julia
using HTTP
using JSON3

mapping = Dict(
    "a" => 1,
    "b" => 2,
)

myjson = JSON3.write(mapping)

println(myjson)