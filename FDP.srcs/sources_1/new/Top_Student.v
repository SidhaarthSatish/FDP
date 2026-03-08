`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME: Kaushik Saravanan (Subtask S)
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (input basys3_clock, input btnD, input SW4, output[7:0] JA, input btnL, input btnR);
     
    wire clk6p25m;
    wire [12:0] pixel_index;
    wire frame_begin;
    wire [15:0] oled_data;  
        
    //6.25 MHz clock
    custom_clock clock(.clock(basys3_clock), .m_val(7), .custom_clock(clk6p25m));
    //Oled Display
    Oled_Display oled(.clk(clk6p25m), .pixel_data(oled_data), .reset(btnD), .frame_begin(frame_begin),
    .cs(JA[0]), .sdin(JA[1]), .sclk(JA[3]), .d_cn(JA[4]),
    .resn(JA[5]), .vccen(JA[6]), .pmoden(JA[7]), .pixel_index(pixel_index));
    //Subtask C
    Task_S task_s(.clk6p25m(clk6p25m), .frame_begin(frame_begin), .btnL(btnL), .btnR(btnR),
    .pixel_index(pixel_index), .oled_data(oled_data));
    

endmodule

/*module Top_Student (
    input basys3_clock, 
    input btnD, btnL, btnR, 
    input [15:0] sw,  // Replaced SW4 with the full switch array required for grading
    output [7:0] JA
);
    wire clk6p25m;
    wire [12:0] pixel_index;
    wire frame_begin;
    
    // Wires for each task's pixel data
    wire [15:0] oled_data_task_s;
    wire [15:0] oled_data_task_q;
    reg [15:0] final_oled_data;  
        
    // 6.25 MHz clock
    custom_clock clock(.clock(basys3_clock), .m_val(7), .custom_clock(clk6p25m));
    
    // Oled Display (Reset hardcoded to 0 to prevent accidental screen resets)
    Oled_Display oled(
        .clk(clk6p25m), .pixel_data(final_oled_data), .reset(1'b0), .frame_begin(frame_begin),
        .cs(JA[0]), .sdin(JA[1]), .sclk(JA[3]), .d_cn(JA[4]),
        .resn(JA[5]), .vccen(JA[6]), .pmoden(JA[7]), .pixel_index(pixel_index)
    );
    
    // Kaushik's Subtask S
    Task_S task_s(
        .clk6p25m(clk6p25m), .frame_begin(frame_begin), .btnL(btnL), .btnR(btnR),
        .pixel_index(pixel_index), .oled_data(oled_data_task_s)
    );
    
    // YOUR Subtask Q
    Task_Q task_q(
        .basys3_clock(basys3_clock), .btnD(btnD), 
        .pixel_index(pixel_index), .oled_data(oled_data_task_q)
    );
    
    // 4.T Integration Multiplexer
    always @(*) begin
        // Truth table implementation from the manual
        if (sw[15] == 1) begin
            final_oled_data = oled_data_task_s; // Task S 
        end else if (sw[15] == 0 && sw[14] == 0 && sw[13] == 1) begin
            final_oled_data = oled_data_task_q; // Task Q 
        end else begin
            final_oled_data = 16'h0000;         // Default black screen
        end
    end

endmodule*/
