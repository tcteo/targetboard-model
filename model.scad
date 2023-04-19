$fn=72;
difference() {
  translate([-112.5, -112.5, 0.05]) {
    cube([225.0, 225.0, 2.9]);
  }
  union() {
    difference() {
      translate([0, 0, 0]) {
        cylinder(h=3, r=42.0);
      }
      translate([0, 0, -0.05]) {
        cylinder(h=3.1, r=40.0);
      }
    }
    rotate([0, 0, 0]) {
      translate([28.2842712474619, 28.284271247461902, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
    rotate([0, 0, 90]) {
      translate([28.2842712474619, 28.284271247461902, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
    rotate([0, 0, 180]) {
      translate([28.2842712474619, 28.284271247461902, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
    rotate([0, 0, 270]) {
      translate([28.2842712474619, 28.284271247461902, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
    difference() {
      translate([0, 0, 0]) {
        cylinder(h=3, r=90.0);
      }
      translate([0, 0, -0.05]) {
        cylinder(h=3.1, r=88.0);
      }
    }
    rotate([0, 0, 0]) {
      translate([62.22539674441617, 62.22539674441619, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
    rotate([0, 0, 90]) {
      translate([62.22539674441617, 62.22539674441619, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
    rotate([0, 0, 180]) {
      translate([62.22539674441617, 62.22539674441619, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
    rotate([0, 0, 270]) {
      translate([62.22539674441617, 62.22539674441619, 0]) {
        translate([0, 0, 0]) {
          cube([100, 2, 4]);
          cube([2, 100, 4]);
        }
      }
    }
  }
}