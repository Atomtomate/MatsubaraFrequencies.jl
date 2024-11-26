abstract type Statistic end
abstract type Bose <: Statistic end
abstract type Fermi <: Statistic end
primitive type MatsubaraIndex{T <: Statistic} <: Integer 64 end