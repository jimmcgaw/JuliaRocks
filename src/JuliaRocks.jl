module JuliaRocks

# adds the public methods in this file to this module
include("MathOps.jl")

# Accessible via JuliaRocks.greet()
greet() = print("Hello World!")

# Export makes function accessible standalone, via: globalgreet()
export globalgreet
globalgreet() = print("Hello brave new world!")

end # module JuliaRocks
