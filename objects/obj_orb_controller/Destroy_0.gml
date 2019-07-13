/// @desc Destroy variables/orbs

instance_destroy(hitbox);

for(var i = 0; i < num_orbs; i++) {
	var orb = ds_list_find_value(orbs, 0);
	ds_list_delete(orbs, 0);
	
	if(orb != undefined) {
		instance_destroy(orb);
	}
}
	
ds_list_destroy(orbs);