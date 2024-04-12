/*
Sonoff Zigbee Wall Mount

Copyright 2024 nomike[AT]nomike[DOT]com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
