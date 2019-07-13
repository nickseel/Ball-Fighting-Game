/// @desc Returns a ds list of indices 0-max, in random order
/// @arg max

var list = ds_list_create();
for(var i = 0; i < argument0; i++) { ds_list_add(list, i); }
ds_list_shuffle(list);

return list;