import scadgen as s
import math

zfe = 0.05

h = 3
base_size = 30
panel_gap = 2


def ring(step=None):
    with s.difference():
        with s.translate([0,0,0]):
            s.cylinder(h=h, r=step*base_size)
        with s.translate([0,0,-zfe]):
            s.cylinder(h=h+2*zfe, r=step*base_size-panel_gap)

def xy_lines(step=None, rot_z=None, length=None):
    angle_deg=45
    tx = ((step*base_size)-panel_gap) * math.sin(angle_deg * (math.pi/180))
    ty = ((step*base_size)-panel_gap) * math.cos(angle_deg * (math.pi/180))
    with s.rotate([0,0,rot_z]):
        with s.translate([tx, ty, 0]):
            with s.translate([0,0,0]):
                s.cube([length,panel_gap,h+1])
                s.cube([panel_gap,length,h+1])

def mx_stem(mx_stem_height=3.6):
    with s.translate([-1.25/2,-3.5/2,0]):
        s.cube([1.25,3.5,mx_stem_height])
    with s.translate([-3.5/2,-1.25/2,0]):
        s.cube([3.5,1.25,mx_stem_height])

def mx_socket(socket_height=5, mx_stem_height=3.6):
    with s.difference():
        s.cylinder(r=2.5,h=socket_height)
        with s.translate([0,0,socket_height-mx_stem_height+zfe]):
            mx_stem()

def model():
    m = s.ScadContext()

    with m:

        # s.cylinder(h=h, r=base_size)

        # with s.intersection():
        #     s.cylinder(h=h, r=base_size*2)
        #     s.cube([10,10,h])
        steps = [1.4, 3.0]
        target_size = 2.5 * base_size * steps[-1]
        with s.difference():
            with s.translate([-target_size/2, -target_size/2, zfe]):
                s.cube([target_size, target_size, h-2*zfe])
            with s.union():
                for step in steps:
                    ring(step=step)
                    for rot in [0,90,180,270]:
                        xy_lines(step=step, rot_z=rot, length=100)

        with s.translate([0,0,h]):
            # socket at 0,0
            mx_socket()
            for rot in range(0,360,45):
                with s.rotate([0, 0, rot]):
                    with s.translate([base_size*(steps[1]+steps[0])/2-panel_gap, 0, 0]):
                        mx_socket()

            # TODO these sockets aren't positioned right.
            for rot_ in range(0,3600,225):
                rot = rot_/10
                with s.rotate([0, 0, rot]):
                    with s.translate([base_size*steps[1]*1.2-panel_gap, 0, 0]):
                        mx_socket()

    return m

def main():
    m = model()
    with open('model.scad', 'w') as f:
        # TODO update scadgen to support global declarations (eg. $fn)
        f.writelines([s+'\n' for s in [
            '$fn=72;'
        ]])
        f.write(m.gen())

if __name__ == '__main__':
    main()
