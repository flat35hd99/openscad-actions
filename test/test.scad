size1 = 1;
size2 = 1;
assert(size1 == 10, "failed use options");
assert(size2 == 100, "failed use options");
// キーキャップの設計

// パラメータの定義

key_diameter = 18; // キーキャップの直径

key_height = 10; // キーキャップの高さ

stem_diameter = 6; // ステムの直径

stem_height = 4; // ステムの高さ

// ステムの定義

module stem() {

  cylinder(d=stem_diameter, h=stem_height, center=true);

}

// キーキャップの定義

module keycap() {

  difference() {

    cylinder(d=key_diameter, h=key_height, center=true); // キーキャップ全体

    translate([0,0,(key_height-stem_height)/2]) stem(); // ステムを中央に配置

  }

}

// キーキャップの出力

keycap();


