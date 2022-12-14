/* Donshan Nezha STU */

$fn = 100;

module switch() {
    translate([82, 0, 6])
        color(c = [.9, .9, .9, 1])
            cube([2.5, 4.5, 2]);
    translate([83, 1.25, 6.5])
        color(c = [.3, .3, .3, 1])
            cube([3, 2, 1]);
}

module connector() {
    translate([0, 0, 0])
        color(c = [.3, .3, .3, 1])
            cube([5, 51, 2.6]);
    for (y = [1.37 : 2.54 : 51]) {
        for (x = [1.23 : 2.54 : 5]) {
            translate([x, y, 4.2])
                color(c = [.7, .7, .7, 1])
                    cube([.7, .7, 8.4], center = true);
        }
    }
}

module platina() {
    color(c = [.7, .3, .7, 1])
        translate([0, 0, -1.6]) {
            difference() {
                cube([100, 100, 1.6]);
            union() {
                translate([4, 4, 0])
                    cylinder(h = 5, r = 1.74, center = true);
                translate([4, 96, 0])
                    cylinder(h = 5, r = 1.74, center = true);
                translate([96, 4, 0])
                    cylinder(h = 5, r = 1.74, center = true);
                translate([96, 96, 0])
                    cylinder(h = 5, r = 1.74, center = true);
            }
        }
    }
    
    translate([3.5, 10, 0])
        connector();

    translate([91.5, 10, 0])
        connector();

    translate([24.5, 95.5, 0])
        rotate([0, 0, 270])
            connector();
    
    translate([0, 24.8, 0])
        switch();

    translate([0, 31.3, 0])
        switch();

    translate([15, 0, 4.8])
        color(c = [.9, .3, .3, 1])
            cube([70, 70, 1.2]);
    translate([13.5, 68, 0])
        color(c = [.3, .3, .3, 1])
            cube([73, 5.5, 9.3]);

    /* Eth */
    translate([54.2, -3, 0])
        color(c = [.7, .7, .7, 1])
            cube([14.2, 14.4, 11.6]);
    /* SD-card */
    translate([37.3, -3, 2.8])
        color(c = [.7, .7, .7, 1])
            cube([11, 14.4, 2]);
    translate([17.2, 0, 6])
        color(c = [.7, .7, .7, 1])
            cube([9, 7.5, 3.3]);
    translate([73.8, 0, 6])
        color(c = [.7, .7, .7, 1])
            cube([9, 7.5, 3.3]);

    translate([34.3, 0, 6])
        color(c = [.7, .7, .7, 1])
            cube([15, 12, 6.5]);

}

module support_b() {
    difference() {
        translate([0, 0, -3.8])
            cylinder(h = 4.4, r = 5.5, center = true);
        union() {
            translate([0, 0, -4])
                cylinder(h = 8, r = 1.75, center = true);
            translate([0, 0, -5.8])
                cylinder(h = 4.4, r = 3.5, center = true);
        }
    }
}

module support_t(alpha = 0, beta = 0) {
    h = 20;
    difference() {
        union() {
            multmatrix(
                m = [
                    [1, 0, 0, 0],
                    [0, 1, alpha, 0.5 * h * alpha],
                    [0, 0, 1, 0.5 * h],
                    [0, 0, 0, 1],
                ]
            ) {
                cylinder(h = h, r = 3.5, center = true);
                rotate([0, 0, beta]) {
                    translate([0, 5.25, 5])
                        cube([2, 10.5, 10], center = true);
                    translate([5.25, 0, 5])
                        cube([10.5, 2, 10], center = true);
                }
            }
        }
            translate([0, 0, 5])
                cylinder(h = 20, r = 1.25, center = true);
        union() {
        }
    }
}

module bottom() {
    color(c = [.3, .3, .3, 1]) {
        difference() {
            union() {
                translate([-2.5, -2.5, -6])
                        cube([105, 105, 2]);
                translate([-2.5, -2.5, -6])
                        cube([105, 2, 24]);
                translate([-2.5, -2.5, -6])
                        cube([2, 5, 24]);
                translate([29.5, -2.5, 8])
                        cube([2, 4, 10]);
                translate([50.7, -2.5, 8])
                        cube([2, 4, 10]);
                translate([70, -2.5, 8])
                        cube([2, 4, 10]);
                translate([100.5, -2.5, -6])
                        cube([2, 5, 24]);
                translate([-2.5, -2.5, 16])
                        cube([105, 4, 2]);
            }
            union() {
                /* Eth */
                translate([53.2, -4, -1])
                    color(c = [.7, .7, .7, 1])
                        cube([16.2, 14.4, 13.6]);
                /* SD-card */
                translate([36.3, -4, 2.8])
                    color(c = [.7, .7, .7, 1])
                        cube([13, 14.4, 5]);
                translate([16.2, -3, 5])
                    color(c = [.7, .7, .7, 1])
                        cube([11, 7.5, 5.3]);
                translate([72.8, -3, 5])
                    color(c = [.7, .7, .7, 1])
                        cube([11, 7.5, 5.3]);

                translate([33.3, -3, 5])
                    color(c = [.7, .7, .7, 1])
                        cube([17, 12, 8.5]);
                translate([4, 4, 0])
                    cylinder(h = 15, r = 3.5, center = true);
                translate([4, 96, 0])
                    cylinder(h = 15, r = 3.5, center = true);
                translate([96, 4, 0])
                    cylinder(h = 15, r = 3.5, center = true);
                translate([96, 96, 0])
                    cylinder(h = 15, r = 3.5, center = true);            
                    
            }
        }
        translate([4, 4, 0])
            support_b();
        translate([4, 96, 0])
            support_b();
        translate([96, 4, 0])
            support_b();
        translate([96, 96, 0])
            support_b();
    }    
}

module push_rod() {
    color(c = [.3, .3, .3, 1]) {
        translate([85, 0.5, 12])
            cube([24, 3.5, 4.0]);
        translate([85, 0.5, 4])
            cube([4, 3.5, 12]);
    }
}

module top() {
    color(c = [1, 0.5, 0.3, 1]) {
        difference() {
            union() {
                difference() {
                    translate([-6.5, -2.5, -4])
                        cube([113, 109, 24.5]);
                    translate([-4.5, -0.5, -6])
                        cube([109, 105, 24.5]);
                }
                multmatrix( m = [
                        [sqrt(2),- 1, 0, 50],
                        [0, 1, 0, 50],
                        [0, 0, 1, 18.5],
                        [0, 0, 0, 1],
                    ]
                ) {
                    cube([14, 44, 4], center = true);
                }
            }
            union() {
                translate([-3, -5.5, -6])
                    cube([106, 105, 24]);
                multmatrix( m = [
                        [sqrt(2),- 1, 0, 50],
                        [0, 1, 0, 50],
                        [0, 0, 1, 21.5],
                        [0, 0, 0, 1],
                    ]
                ) {
                    cube([2, 40, 15], center = true);
                    translate([4, 0, 0])
                        cube([2, 40, 15], center = true);
                    translate([-4, 0, 0])
                        cube([2, 40, 15], center = true);
                }
            translate([85, 24.8, 11.5])
                cube([30, 4.5, 5.0]);
            translate([85, 31.3, 11.5])
                cube([30, 4.5, 5.0]);
            }
        }
        
        translate([86, 22.8, 16.5])
            cube([20, 15, 4]);

        translate([86, 22.8, 9.5])
            cube([20, 2, 9]);
        translate([86, 22.8 + 6.5, 9.5])
            cube([20, 2, 9]);
        translate([86, 22.8 + 13, 9.5])
            cube([20, 2, 9]);
        
        translate([86, 22.8, 5.5])
            cube([5, 2, 9]);
        translate([86, 22.8 + 6.5, 5.5])
            cube([5, 2, 9]);
        translate([86, 22.8 + 13, 5.5])
            cube([5, 2, 9]);

        translate([91, 22.8, 9.5])
            cube([15, 15, 2]);
       
        translate([4, 4, 0])
            support_t(0.1, 90);
        translate([4, 96, 0])
            support_t(0, 90);
        translate([96, 4, 0])
            support_t(0.1);
        translate([96, 96, 0])
            support_t();    
    }
}


translate([0, 24.8, 0])
    push_rod();

translate([0, 31.3, 0])
    push_rod();

platina();
translate([0, 0.01, 0]) {
bottom();
}
top();

rotate([180, 0, 0]) {
    // top();
}

rotate([90, 0, 0]) {
    // push_rod();
}
