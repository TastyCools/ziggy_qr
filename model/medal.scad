// Cat Medal with 22x22mm QR recess and top hole (round, closer to top edge)

// Parameters
medal_diameter = 35;
medal_thickness = 2;
recess_size = 22;
recess_depth = 1;
hole_diameter = 4;

// Move the hole closer to the top edge (just ~1mm from the edge)
hole_center_offset = (medal_diameter / 2) - (hole_diameter / 2) - 1;

difference() {
    // Base circular medal
    cylinder(h = medal_thickness, d = medal_diameter, $fn = 100);

    // QR code recess in center
    translate([-(recess_size/2), -(recess_size/2), medal_thickness - recess_depth])
        cube([recess_size, recess_size, recess_depth]);

    // Hole at the top (round, centered in X, raised in Y)
    translate([0, hole_center_offset, -medal_thickness/2])
        rotate([0, 0, 90])
            cylinder(h = medal_thickness * 2, d = hole_diameter, $fn = 50);
}
