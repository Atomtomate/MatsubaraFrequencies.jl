using MatsubaraFrequencies
using Test


@testset "MatsubaraFrequencies.jl" begin
    wmm1::MatsubaraIndex{Bose} = MatsubaraIndex(-1, Bose)
    wm0::MatsubaraIndex{Bose} = MatsubaraIndex(0, Bose)
    wm1::MatsubaraIndex{Bose} = MatsubaraIndex(1, Bose)
    wm2::MatsubaraIndex{Bose} = MatsubaraIndex(2, Bose)
    wm3::MatsubaraIndex{Bose} = MatsubaraIndex(3, Bose)
    wm4::MatsubaraIndex{Bose} = MatsubaraIndex(4, Bose)
    wm5::MatsubaraIndex{Bose} = MatsubaraIndex(5, Bose)
    wm6::MatsubaraIndex{Bose} = MatsubaraIndex(6, Bose)
    wm7::MatsubaraIndex{Bose} = MatsubaraIndex(7, Bose)
    wm8::MatsubaraIndex{Bose} = MatsubaraIndex(8, Bose)
    
    vnm2::MatsubaraIndex{Fermi} = MatsubaraIndex(-2, Fermi)
    vnm1::MatsubaraIndex{Fermi} = MatsubaraIndex(-1, Fermi)
    vn0::MatsubaraIndex{Fermi} = MatsubaraIndex(0, Fermi)
    vn1::MatsubaraIndex{Fermi} = MatsubaraIndex(1, Fermi)
    vn2::MatsubaraIndex{Fermi} = MatsubaraIndex(2, Fermi)
    vn3::MatsubaraIndex{Fermi} = MatsubaraIndex(3, Fermi)
    vn4::MatsubaraIndex{Fermi} = MatsubaraIndex(4, Fermi)
    vn5::MatsubaraIndex{Fermi} = MatsubaraIndex(5, Fermi)
    vn6::MatsubaraIndex{Fermi} = MatsubaraIndex(6, Fermi)
    vn7::MatsubaraIndex{Fermi} = MatsubaraIndex(7, Fermi)
    vn8::MatsubaraIndex{Fermi} = MatsubaraIndex(8, Fermi)

    @testset "Operators" begin

        @test -wm0 == wm0                  # "-B"
        @test -vn1 == vn0                  # "-F"
        @test -vn0 == vn1                  # "-F"

        @test wm1 + wm2 == wm3             # "B+B"
        @test wm2 + wm1 == wm3             # "B+B"
        @test wm1 + vn3 == vn4             # "B+F"
        @test vn3 + wm1 == vn4             # "B+F"
        @test vn4 + wm2 == vn6             # "F+B"
        @test wm2 + vn4 == vn6             # "F+B"
        @test vn4 + vn3 == wm8             # "F+F"
        @test vn3 + vn4 == wm8             # "F+F"

        @test wm1 - wm2 == wmm1            # "B-B"
        @test wm2 - wm1 == wm1             # "B-B"
        @test wm1 - vn2 == vnm2            # "B-F"
        @test vn4 - wm2 == vn2             # "F-B"
        @test vnm1 - wmm1 == vn0           # "F-B"
        @test vn4 - vn3 == wm1             # "F-F"
        @test vn3 - vn4 == wmm1            # "F-F"
        @test vn3 - vn0 == wm3             # "F-F"
        @test vn3 - vn3 == wm0             # "F-F"
    end
end
