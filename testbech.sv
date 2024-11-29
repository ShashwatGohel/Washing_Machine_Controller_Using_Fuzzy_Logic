// Testbench Code: 
module tb_full_controller;

    reg clk, rst;
    reg [7:0] load_sensor, water_sensor, detergent_sensor;
    wire [1:0] load_category, water_category, detergent_category, wash_mode;
    wire wash_motor, rinse_valve, spin_motor, drain_valve;

    // Instantiate modules
    load_size load_module(.load_sensor(load_sensor), .load_category(load_category));
    water_level water_module(.water_sensor(water_sensor), .water_category(water_category));
    detergent_level detergent_module(.detergent_sensor(detergent_sensor), .detergent_category(detergent_category));
    wash_mode mode_module(.load_category(load_category), .water_category(water_category), .detergent_category(detergent_category), .wash_mode(wash_mode));
    cycle_control control_module(.clk(clk), .rst(rst), .wash_mode(wash_mode), .wash_motor(wash_motor), .rinse_valve(rinse_valve), .spin_motor(spin_motor), .drain_valve(drain_valve));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0; rst = 1;
        load_sensor = 8'd100; water_sensor = 8'd150; detergent_sensor = 8'd50;
        #10 rst = 0;

        // Test sequence
        #10 load_sensor = 8'd250; water_sensor = 8'd90; detergent_sensor = 8'd60;
        #50 load_sensor = 8'd50; water_sensor = 8'd200; detergent_sensor = 8'd120;
        #50 $finish;
    end

    initial begin
        $monitor("Time: %0d, Load Cat: %b, Water Cat: %b, Det Cat: %b, Wash Mode: %b, Wash Motor: %b, Rinse Valve: %b, Spin Motor: %b, Drain Valve: %b", $time, load_category, water_category, detergent_category, wash_mode, wash_motor, rinse_valve, spin_motor, drain_valve);
        $dumpfile("tb_full_controller.vcd");
        $dumpvars(0, tb_full_controller);
    end
endmodule
