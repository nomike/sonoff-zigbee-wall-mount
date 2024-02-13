.PHONY: upload

sonoff_zigbee_wall_mount.stl: sonoff_zigbee_wall_mount.scad
	openscad -o $@ $<

publish: sonoff_zigbee_wall_mount.stl
	thingiverse-publisher

clean: 
	rm -f sonoff_zigbee_wall_mount.stl
