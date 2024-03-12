/*
Sonoff Zigbee Wall Mount
(C) 2024 - nomike[at]nomike[dot]com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

inner_width = 13;
inner_length = 36;
inner_height = 52;
base_height = 3;
wall_strength = 2;
usb_offset_y = 0; // 3
usb_offset_x = -1.5; // 0
usb_cutout_width = 5;
usb_cutout_length = 12.5;

outer_width = inner_width + (2 * wall_strength);
outer_length = inner_length + (2 * wall_strength);
front_slit_length = 20;

union() {
    difference() {
        translate([
            0,
            0,
            0
        ])
        cube([
            outer_width,
            outer_length,
            base_height
        ]);
        
        translate([
            ((outer_width - usb_cutout_width) / 2) + usb_offset_x,
            ((outer_length - usb_cutout_length) / 2) + usb_offset_y,
            0
        ])
        cube([
            usb_cutout_width,
            usb_cutout_length,
            base_height
        ]);
    }
    difference() {
        translate([0, 0, base_height]) cube([inner_width + (2 * wall_strength), inner_length + (2 * wall_strength), inner_height]);
        translate([wall_strength, wall_strength, base_height]) cube([inner_width, inner_length, inner_height]);
        translate([outer_width - wall_strength, (outer_length - front_slit_length) / 2, base_height]) cube([wall_strength, front_slit_length, inner_height]);

    }
}
