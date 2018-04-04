/// @desc Returns a random range, but weighted towards one extreme
/// @arg lower cap
/// @arg upper cap
/// @arg power

return (power(random_range(0, 1), argument2) * (argument1 - argument0)) + argument0;