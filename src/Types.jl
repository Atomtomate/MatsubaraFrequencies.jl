abstract type Statistic end
abstract type Bose <: Statistic end
abstract type Fermi <: Statistic end
primitive type MatsubaraIndex{T <: Statistic} <: Integer 64 end

function MatsubaraIndex(x::Integer, t::Type{T}) where T <: Statistic
    reinterpret(MatsubaraIndex{t}, x)
end

function Integer(x::MatsubaraIndex{T}) where T <: Statistic
    reinterpret(Int64, x)
end