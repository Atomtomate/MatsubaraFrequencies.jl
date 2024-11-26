function MatsubaraIndex(x::Integer, t::Type{T}) where T <: Statistic
    reinterpret(MatsubaraIndex{t}, x)
end

function Integer(x::MatsubaraIndex{T}) where T <: Statistic
    reinterpret(Int64, x)
end