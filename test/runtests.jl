using Base.Test

using RigidBodyDynamics
using Quaternions
using StaticArrays
using Compat
import ForwardDiff

include("test_tree.jl")
include("test_frames.jl")
include("test_spatial.jl")
include("test_double_pendulum.jl")
include("test_mechanism_algorithms.jl")
include("test_mechanism_manipulation.jl")

if VERSION < v"0.6-dev"
    @testset "example notebooks" begin
        using IJulia
        jupyter = IJulia.jupyter
        for f in filter(x -> endswith(x, "ipynb"), readdir("../examples"))
            notebook = "../examples/" * f
            run(`$jupyter nbconvert --to notebook --execute $notebook --output $notebook`)
        end
    end
end
