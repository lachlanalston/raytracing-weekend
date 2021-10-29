const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
     // Image
    const image_width: i32 = 256;
    const image_height: i32 = 256; 
    // Render
    try stdout.print("P3\n{}", .{image_width});
    try stdout.print("\t{}\n255\n", .{image_height});
        
    var j: i32 = image_height-1;
    while(j>=0) : (j-=1){
        std.log.debug("\nScanlines remaining: {}\n", .{j});
        var i: i32 = 0;
        while(i<image_width) : (i+=1){
            var r: f64 = @intToFloat(f64,i) / (@intToFloat(f64,image_width -1));
            var g: f64 = @intToFloat(f64,j) / (@intToFloat(f64,image_height -1));
            var b: f64 = 0.25;

            var ir: i32 = @floatToInt(c_int, 255.999 * r);
            var ig: i32 = @floatToInt(c_int, 255.999 * g);
            var ib: i32 = @floatToInt(c_int, 255.999 * b);

            try stdout.print("{}\t", .{ir});
            try stdout.print("{}\t", .{ig});
            try stdout.print("{}\n", .{ib});
         }
    }
    std.log.debug("\nDone\n", .{});
}

