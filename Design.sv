// Design Code: 
// Code your design here
module load_size(
    input [7:0] load_sensor,  // Load sensor input
    output reg [1:0] load_category // 2-bit load category: 00 - Small, 01 - Medium, 10 - Large
);

    always @(*) begin
        if (load_sensor < 8'd85)
            load_category = 2'b00; // Small
        else if (load_sensor < 8'd170)
            load_category = 2'b01; // Medium
        else
            load_category = 2'b10; // Large
    end
endmodule
module water_level(
    input [7:0] water_sensor,  // Water level sensor input
    output reg [1:0] water_category // 2-bit water level: 00 - Low, 01 - Medium, 10 - High
);

    always @(*) begin
        if (water_sensor < 8'd85)
            water_category = 2'b00; // Low
        else if (water_sensor < 8'd170)
            water_category = 2'b01; // Medium
        else
            water_category = 2'b10; // High
    end
endmodule
module detergent_level(
    input [7:0] detergent_sensor,  // Detergent level sensor input
    output reg [1:0] detergent_category // 2-bit detergent level: 00 - Light, 01 - Medium, 10 - Heavy
);

    always @(*) begin
        if (detergent_sensor < 8'd85)
            detergent_category = 2'b00; // Light
        else if (detergent_sensor < 8'd170)
            detergent_category = 2'b01; // Medium
        else
            detergent_category = 2'b10; // Heavy
    end
endmodule
module wash_mode(
    input [1:0] load_category,      // Load size input
    input [1:0] water_category,     // Water level input
    input [1:0] detergent_category, // Detergent level input
    output reg [1:0] wash_mode      // Wash mode: 00 - Gentle, 01 - Normal, 10 - Heavy
);

    always @(*) begin
        // Determine wash mode based on fuzzy inputs
        if (load_category == 2'b10 || detergent_category == 2'b10)
            wash_mode = 2'b10; // Heavy
        else if (load_category == 2'b01 || water_category == 2'b01)
            wash_mode = 2'b01; // Normal
        else
            wash_mode = 2'b00; // Gentle
    end
endmodule
module cycle_control(
    input clk,
    input rst,
    input [1:0] wash_mode,        // Wash mode
    output reg wash_motor,        // Wash motor control
    output reg rinse_valve,       // Rinse valve control
    output reg spin_motor,        // Spin motor control
    output reg drain_valve        // Drain control
);

    typedef enum reg [2:0] {IDLE, WASH, RINSE, SPIN, DRAIN} state_t;
    state_t current_state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin
        // Default settings
        wash_motor = 0;
        rinse_valve = 0;
        spin_motor = 0;
        drain_valve = 0;
        next_state = current_state;

        case (current_state)
            IDLE: next_state = WASH;
            WASH: begin
                wash_motor = 1;
                next_state = RINSE;
            end
            RINSE: begin
                rinse_valve = 1;
                next_state = SPIN;
            end
            SPIN: begin
                spin_motor = 1;
                next_state = DRAIN;
            end
            DRAIN: begin
                drain_valve = 1;
                next_state = IDLE;
            end
        endcase
    end
endmodule
