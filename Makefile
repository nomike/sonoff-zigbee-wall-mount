sonoff_zigbee_wall_mount.stl: sonoff_zigbee_wall_mount.scad
	openscad -o $@ $<

clean: 
	rm -f sonoff_zigbee_wall_mount.stl
