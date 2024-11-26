tray_depth=220; // fixed
tray_width=140; // fixed
tray_height=24; // variable
tray_wall=4;

difference() {

    union() { 
        cube([tray_depth,tray_width,tray_wall]); // Fixed thickness of resting surface
        // end legs
        translate([0,0,tray_wall]) cube([tray_wall,tray_width,tray_height]);
        translate([(tray_depth-tray_wall),0,tray_wall]) cube ([tray_wall,tray_width,tray_height]);
        // support slants
        translate([(tray_depth-tray_height-(tray_wall*2)),0,0]) rotate([270,270,0]) linear_extrude(tray_width) polygon([[0,0],[0,tray_height+tray_wall],[tray_height+tray_wall,tray_height+tray_wall]]);
        translate([tray_wall,0,tray_height+tray_wall]) rotate([270,0,0]) linear_extrude(tray_width) polygon([[0,0],[0,tray_height],[tray_height,tray_height]]);
        // positive registration
        translate([(tray_wall/2),tray_wall,tray_height+tray_wall]) rotate([270,270,0]) cylinder(tray_width-(tray_wall*2),r=(tray_wall/2)-1, $fn=128);
        translate([tray_depth-(tray_wall/2),tray_wall,tray_height+tray_wall]) rotate([270,0,0]) cylinder(tray_width-(tray_wall*2),r=(tray_wall/2)-1, $fn=128);
    }
    
    translate([tray_wall,tray_wall,tray_wall]) cube([tray_depth-(tray_wall*2), tray_width-(tray_wall*2), tray_height]);// interior void
    // negative registration
    translate([(tray_wall/2),tray_wall,0]) rotate([270,270,0]) cylinder(tray_width-(tray_wall*2),r=(tray_wall/2)-1, $fn=128);
    translate([tray_depth-(tray_wall/2),tray_wall,0]) rotate([270,0,0]) cylinder(tray_width-(tray_wall*2),r=(tray_wall/2)-1, $fn=128);
    
    
    // cutouts
    /*
    Space Invader - 208mm x 122mm x 16mm
    Dog Paw - 214mm x 108mm x 20mm 
    Dog Bone - 202mm x 126mm x 24mm
    Fruit - 216mm x 104mm x 17mm
    */
    
    //space invader
    //translate([(tray_depth/2)-(190/2),(tray_width/2)-(104/2),0]) cube([190, 104, tray_wall]);
    //fruit
    //translate([(tray_depth/2)-(210/2),(tray_width/2)-(96/2),0]) fruit_cutouts();
    //dogbone
    translate([(tray_depth/2)-(176/2),(tray_width/2)-(80/2),0]) dogbone_cutouts();
    
};


module fruit_cutouts() {
    // 96, 30 + 3 + 30 + 3+ 30
    cube([210, 30, tray_wall]);
    translate([0,33,0]) cube([210, 30, tray_wall]);
    translate([0,66,0]) cube([210, 30, tray_wall]);
};

module dogbone_cutouts() {
    // 176 x 80
    // (176 - 8)/3 = 56
    translate([0,0,0]) cube([56, 26, tray_wall]);
    translate([60,0,0]) cube([56, 26, tray_wall]);
    translate([120,0,0]) cube([56, 26, tray_wall]);
    translate([0,54,0]) cube([56, 26, tray_wall]);
    translate([60,54,0]) cube([56, 26, tray_wall]);
    translate([120,54,0]) cube([56, 26, tray_wall]);
};