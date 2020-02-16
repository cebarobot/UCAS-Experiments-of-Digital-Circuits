// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Nov 27 21:10:26 2019
// Host        : CEBA-X1C running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/ceba_/working/verilog/project_watch/watch.sim/sim_1/synth/timing/xsim/testbench_time_synth.v
// Design      : watch
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* COUNTER_SUM = "27'b000000000000000000000000000" *) 
(* NotValidForBitStream *)
module watch
   (clk,
    resetn,
    set,
    key_col1,
    key_col2,
    key_row2,
    key_row3,
    key_row4,
    num0_scan_select,
    num0_seg7);
  input clk;
  input resetn;
  input set;
  output key_col1;
  output key_col2;
  input key_row2;
  input key_row3;
  input key_row4;
  output [5:0]num0_scan_select;
  output [6:0]num0_seg7;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [1:0]hour_h;
  wire \hour_h[0]_i_1_n_0 ;
  wire \hour_h[1]_i_1_n_0 ;
  wire \hour_h[1]_i_3_n_0 ;
  wire \hour_h[1]_i_4_n_0 ;
  wire \hour_h[1]_i_5_n_0 ;
  wire \hour_h[1]_i_6_n_0 ;
  wire \hour_h[1]_i_7_n_0 ;
  wire hour_h_addEn;
  wire [3:0]hour_l;
  wire \hour_l[0]_i_1_n_0 ;
  wire \hour_l[1]_i_1_n_0 ;
  wire \hour_l[2]_i_1_n_0 ;
  wire \hour_l[3]_i_2_n_0 ;
  wire \hour_l[3]_i_3_n_0 ;
  wire \hour_l[3]_i_4_n_0 ;
  wire hour_l_addEn;
  wire key_col1;
  wire key_col1_OBUF;
  wire key_col2;
  wire key_col2_OBUF;
  wire key_row2;
  wire key_row2_IBUF;
  wire key_row3;
  wire key_row3_IBUF;
  wire key_row4;
  wire key_row4_IBUF;
  wire [2:0]min_h;
  wire \min_h[0]_i_1_n_0 ;
  wire \min_h[1]_i_1_n_0 ;
  wire \min_h[2]_i_1_n_0 ;
  wire \min_h[2]_i_2_n_0 ;
  wire \min_h[2]_i_3_n_0 ;
  wire [3:0]min_l;
  wire \min_l[0]_i_1_n_0 ;
  wire \min_l[1]_i_1_n_0 ;
  wire \min_l[2]_i_1_n_0 ;
  wire \min_l[3]_i_2_n_0 ;
  wire \min_l[3]_i_3_n_0 ;
  wire \min_l[3]_i_4_n_0 ;
  wire min_l_addEn;
  wire next_state1;
  wire \num0_scan_data_reg_n_0_[0] ;
  wire \num0_scan_data_reg_n_0_[1] ;
  wire [5:0]num0_scan_select;
  wire [6:0]num0_seg7;
  wire \num0_seg7[1]_i_1_n_0 ;
  wire \num0_seg7[2]_i_1_n_0 ;
  wire \num0_seg7[4]_i_1_n_0 ;
  wire \num0_seg7[6]_i_1_n_0 ;
  wire [5:0]num0_seg7_OBUF;
  wire [3:0]p_0_in;
  wire p_0_in5_in;
  wire p_1_in6_in;
  wire resetn;
  wire resetn_IBUF;
  wire [2:0]sec_h;
  wire \sec_h[0]_i_1_n_0 ;
  wire \sec_h[1]_i_1_n_0 ;
  wire \sec_h[2]_i_1_n_0 ;
  wire \sec_h[2]_i_3_n_0 ;
  wire sec_h_addEn;
  wire [3:0]sec_l;
  wire \sec_l[0]_i_1_n_0 ;
  wire \sec_l[1]_i_1_n_0 ;
  wire \sec_l[2]_i_1_n_0 ;
  wire \sec_l[3]_i_2_n_0 ;
  wire sec_l_addEn;
  wire set;
  wire set_IBUF;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire \state_count[3]_i_1_n_0 ;
  wire \state_count_reg_n_0_[0] ;
  wire \state_count_reg_n_0_[1] ;
  wire \state_count_reg_n_0_[2] ;

initial begin
 $sdf_annotate("testbench_time_synth.sdf",,,,"tool_control");
end
  LUT6 #(
    .INIT(64'h1101FFFF11010000)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[2]),
        .I1(next_state1),
        .I2(state[1]),
        .I3(state[0]),
        .I4(p_0_in5_in),
        .I5(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1500FFFF15000000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[2]),
        .I1(next_state1),
        .I2(state[1]),
        .I3(state[0]),
        .I4(p_0_in5_in),
        .I5(state[1]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(resetn_IBUF),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0006FFFF00060000)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(next_state1),
        .I3(state[0]),
        .I4(p_0_in5_in),
        .I5(state[2]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(key_row4_IBUF),
        .I1(key_row3_IBUF),
        .I2(key_row2_IBUF),
        .O(next_state1));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:011,iSTATE2:010,iSTATE3:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:011,iSTATE2:010,iSTATE3:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:011,iSTATE2:010,iSTATE3:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_2_n_0 ),
        .Q(state[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h2600)) 
    \hour_h[0]_i_1 
       (.I0(hour_h[0]),
        .I1(hour_h_addEn),
        .I2(hour_h[1]),
        .I3(resetn_IBUF),
        .O(\hour_h[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6200)) 
    \hour_h[1]_i_1 
       (.I0(hour_h[1]),
        .I1(hour_h_addEn),
        .I2(hour_h[0]),
        .I3(resetn_IBUF),
        .O(\hour_h[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAEAAAAAAAAAAAA)) 
    \hour_h[1]_i_2 
       (.I0(\hour_h[1]_i_3_n_0 ),
        .I1(\hour_h[1]_i_4_n_0 ),
        .I2(\hour_h[1]_i_5_n_0 ),
        .I3(\hour_l[3]_i_3_n_0 ),
        .I4(\hour_h[1]_i_6_n_0 ),
        .I5(\hour_h[1]_i_7_n_0 ),
        .O(hour_h_addEn));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \hour_h[1]_i_3 
       (.I0(key_row2_IBUF),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(p_0_in5_in),
        .I5(set_IBUF),
        .O(\hour_h[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000400)) 
    \hour_h[1]_i_4 
       (.I0(sec_l[2]),
        .I1(sec_l[3]),
        .I2(sec_l[1]),
        .I3(sec_l[0]),
        .I4(set_IBUF),
        .O(\hour_h[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \hour_h[1]_i_5 
       (.I0(sec_h[2]),
        .I1(sec_h[1]),
        .I2(sec_h[0]),
        .O(\hour_h[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \hour_h[1]_i_6 
       (.I0(hour_l[2]),
        .I1(hour_l[0]),
        .I2(min_l[2]),
        .I3(min_l[3]),
        .I4(min_l[1]),
        .I5(min_l[0]),
        .O(\hour_h[1]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0F20)) 
    \hour_h[1]_i_7 
       (.I0(hour_h[1]),
        .I1(hour_h[0]),
        .I2(hour_l[1]),
        .I3(hour_l[3]),
        .O(\hour_h[1]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hour_h_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\hour_h[0]_i_1_n_0 ),
        .Q(hour_h[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hour_h_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\hour_h[1]_i_1_n_0 ),
        .Q(hour_h[1]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \hour_l[0]_i_1 
       (.I0(hour_l[0]),
        .O(\hour_l[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0BF0)) 
    \hour_l[1]_i_1 
       (.I0(hour_l[2]),
        .I1(hour_l[3]),
        .I2(hour_l[1]),
        .I3(hour_l[0]),
        .O(\hour_l[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FDFF00FF00FF00)) 
    \hour_l[2]_i_1 
       (.I0(hour_h[1]),
        .I1(hour_h[0]),
        .I2(hour_l[3]),
        .I3(hour_l[2]),
        .I4(hour_l[0]),
        .I5(hour_l[1]),
        .O(\hour_l[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02020202FF020202)) 
    \hour_l[3]_i_1 
       (.I0(\min_l[3]_i_4_n_0 ),
        .I1(\hour_l[3]_i_3_n_0 ),
        .I2(\min_h[2]_i_2_n_0 ),
        .I3(\min_l[3]_i_3_n_0 ),
        .I4(\hour_l[3]_i_4_n_0 ),
        .I5(key_row2_IBUF),
        .O(hour_l_addEn));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h68AA)) 
    \hour_l[3]_i_2 
       (.I0(hour_l[3]),
        .I1(hour_l[2]),
        .I2(hour_l[1]),
        .I3(hour_l[0]),
        .O(\hour_l[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \hour_l[3]_i_3 
       (.I0(min_h[2]),
        .I1(min_h[1]),
        .I2(min_h[0]),
        .O(\hour_l[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \hour_l[3]_i_4 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .O(\hour_l[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hour_l_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(hour_l_addEn),
        .D(\hour_l[0]_i_1_n_0 ),
        .Q(hour_l[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hour_l_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(hour_l_addEn),
        .D(\hour_l[1]_i_1_n_0 ),
        .Q(hour_l[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hour_l_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(hour_l_addEn),
        .D(\hour_l[2]_i_1_n_0 ),
        .Q(hour_l[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hour_l_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(hour_l_addEn),
        .D(\hour_l[3]_i_2_n_0 ),
        .Q(hour_l[3]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  OBUF key_col1_OBUF_inst
       (.I(key_col1_OBUF),
        .O(key_col1));
  LUT3 #(
    .INIT(8'h06)) 
    key_col1_OBUF_inst_i_1
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .O(key_col1_OBUF));
  OBUF key_col2_OBUF_inst
       (.I(key_col2_OBUF),
        .O(key_col2));
  LUT2 #(
    .INIT(4'h2)) 
    key_col2_OBUF_inst_i_1
       (.I0(state[0]),
        .I1(state[2]),
        .O(key_col2_OBUF));
  IBUF key_row2_IBUF_inst
       (.I(key_row2),
        .O(key_row2_IBUF));
  IBUF key_row3_IBUF_inst
       (.I(key_row3),
        .O(key_row3_IBUF));
  IBUF key_row4_IBUF_inst
       (.I(key_row4),
        .O(key_row4_IBUF));
  LUT6 #(
    .INIT(64'hBFBF00BF4040FF40)) 
    \min_h[0]_i_1 
       (.I0(key_row3_IBUF),
        .I1(p_1_in6_in),
        .I2(\min_l[3]_i_3_n_0 ),
        .I3(\min_l[3]_i_4_n_0 ),
        .I4(\min_h[2]_i_2_n_0 ),
        .I5(min_h[0]),
        .O(\min_h[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \min_h[0]_i_2 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .O(p_1_in6_in));
  LUT6 #(
    .INIT(64'h3333F3FF44440400)) 
    \min_h[1]_i_1 
       (.I0(min_h[2]),
        .I1(min_h[0]),
        .I2(\min_h[2]_i_2_n_0 ),
        .I3(\min_l[3]_i_4_n_0 ),
        .I4(\min_h[2]_i_3_n_0 ),
        .I5(min_h[1]),
        .O(\min_h[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555F5FF88880800)) 
    \min_h[2]_i_1 
       (.I0(min_h[0]),
        .I1(min_h[1]),
        .I2(\min_h[2]_i_2_n_0 ),
        .I3(\min_l[3]_i_4_n_0 ),
        .I4(\min_h[2]_i_3_n_0 ),
        .I5(min_h[2]),
        .O(\min_h[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \min_h[2]_i_2 
       (.I0(min_l[0]),
        .I1(min_l[1]),
        .I2(min_l[3]),
        .I3(min_l[2]),
        .O(\min_h[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \min_h[2]_i_3 
       (.I0(key_row3_IBUF),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(p_0_in5_in),
        .I5(set_IBUF),
        .O(\min_h[2]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \min_h_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\min_h[0]_i_1_n_0 ),
        .Q(min_h[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \min_h_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\min_h[1]_i_1_n_0 ),
        .Q(min_h[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \min_h_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\min_h[2]_i_1_n_0 ),
        .Q(min_h[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \min_l[0]_i_1 
       (.I0(min_l[0]),
        .O(\min_l[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0BF0)) 
    \min_l[1]_i_1 
       (.I0(min_l[2]),
        .I1(min_l[3]),
        .I2(min_l[1]),
        .I3(min_l[0]),
        .O(\min_l[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \min_l[2]_i_1 
       (.I0(min_l[2]),
        .I1(min_l[0]),
        .I2(min_l[1]),
        .O(\min_l[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000200)) 
    \min_l[3]_i_1 
       (.I0(\min_l[3]_i_3_n_0 ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(key_row3_IBUF),
        .I5(\min_l[3]_i_4_n_0 ),
        .O(min_l_addEn));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h68AA)) 
    \min_l[3]_i_2 
       (.I0(min_l[3]),
        .I1(min_l[2]),
        .I2(min_l[1]),
        .I3(min_l[0]),
        .O(\min_l[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \min_l[3]_i_3 
       (.I0(set_IBUF),
        .I1(p_0_in5_in),
        .O(\min_l[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \min_l[3]_i_4 
       (.I0(set_IBUF),
        .I1(\sec_h[2]_i_3_n_0 ),
        .I2(sec_h[0]),
        .I3(sec_h[1]),
        .I4(sec_h[2]),
        .O(\min_l[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \min_l_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(min_l_addEn),
        .D(\min_l[0]_i_1_n_0 ),
        .Q(min_l[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \min_l_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(min_l_addEn),
        .D(\min_l[1]_i_1_n_0 ),
        .Q(min_l[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \min_l_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(min_l_addEn),
        .D(\min_l[2]_i_1_n_0 ),
        .Q(min_l[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \min_l_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(min_l_addEn),
        .D(\min_l[3]_i_2_n_0 ),
        .Q(min_l[3]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num0_scan_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(hour_h[0]),
        .Q(\num0_scan_data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \num0_scan_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(hour_h[1]),
        .Q(\num0_scan_data_reg_n_0_[1] ),
        .R(1'b0));
  OBUF \num0_scan_select_OBUF[0]_inst 
       (.I(1'b1),
        .O(num0_scan_select[0]));
  OBUF \num0_scan_select_OBUF[1]_inst 
       (.I(1'b1),
        .O(num0_scan_select[1]));
  OBUF \num0_scan_select_OBUF[2]_inst 
       (.I(1'b1),
        .O(num0_scan_select[2]));
  OBUF \num0_scan_select_OBUF[3]_inst 
       (.I(1'b1),
        .O(num0_scan_select[3]));
  OBUF \num0_scan_select_OBUF[4]_inst 
       (.I(1'b1),
        .O(num0_scan_select[4]));
  OBUF \num0_scan_select_OBUF[5]_inst 
       (.I(1'b0),
        .O(num0_scan_select[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \num0_seg7[1]_i_1 
       (.I0(\num0_scan_data_reg_n_0_[1] ),
        .I1(\num0_scan_data_reg_n_0_[0] ),
        .O(\num0_seg7[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \num0_seg7[2]_i_1 
       (.I0(\num0_scan_data_reg_n_0_[0] ),
        .O(\num0_seg7[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \num0_seg7[4]_i_1 
       (.I0(\num0_scan_data_reg_n_0_[0] ),
        .I1(\num0_scan_data_reg_n_0_[1] ),
        .O(\num0_seg7[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \num0_seg7[6]_i_1 
       (.I0(\num0_scan_data_reg_n_0_[1] ),
        .I1(\num0_scan_data_reg_n_0_[0] ),
        .O(\num0_seg7[6]_i_1_n_0 ));
  OBUF \num0_seg7_OBUF[0]_inst 
       (.I(num0_seg7_OBUF[0]),
        .O(num0_seg7[0]));
  OBUF \num0_seg7_OBUF[1]_inst 
       (.I(num0_seg7_OBUF[1]),
        .O(num0_seg7[1]));
  OBUF \num0_seg7_OBUF[2]_inst 
       (.I(num0_seg7_OBUF[2]),
        .O(num0_seg7[2]));
  OBUF \num0_seg7_OBUF[3]_inst 
       (.I(num0_seg7_OBUF[3]),
        .O(num0_seg7[3]));
  OBUF \num0_seg7_OBUF[4]_inst 
       (.I(num0_seg7_OBUF[4]),
        .O(num0_seg7[4]));
  OBUF \num0_seg7_OBUF[5]_inst 
       (.I(num0_seg7_OBUF[5]),
        .O(num0_seg7[5]));
  OBUF \num0_seg7_OBUF[6]_inst 
       (.I(num0_seg7_OBUF[3]),
        .O(num0_seg7[6]));
  FDRE #(
    .INIT(1'b0)) 
    \num0_seg7_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\num0_scan_data_reg_n_0_[1] ),
        .Q(num0_seg7_OBUF[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num0_seg7_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\num0_seg7[1]_i_1_n_0 ),
        .Q(num0_seg7_OBUF[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num0_seg7_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\num0_seg7[2]_i_1_n_0 ),
        .Q(num0_seg7_OBUF[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num0_seg7_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\num0_seg7[4]_i_1_n_0 ),
        .Q(num0_seg7_OBUF[4]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num0_seg7_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(1'b1),
        .Q(num0_seg7_OBUF[5]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num0_seg7_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\num0_seg7[6]_i_1_n_0 ),
        .Q(num0_seg7_OBUF[3]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  IBUF resetn_IBUF_inst
       (.I(resetn),
        .O(resetn_IBUF));
  LUT2 #(
    .INIT(4'h6)) 
    \sec_h[0]_i_1 
       (.I0(sec_h_addEn),
        .I1(sec_h[0]),
        .O(\sec_h[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h3F40)) 
    \sec_h[1]_i_1 
       (.I0(sec_h[2]),
        .I1(sec_h[0]),
        .I2(sec_h_addEn),
        .I3(sec_h[1]),
        .O(\sec_h[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h5F80)) 
    \sec_h[2]_i_1 
       (.I0(sec_h[0]),
        .I1(sec_h[1]),
        .I2(sec_h_addEn),
        .I3(sec_h[2]),
        .O(\sec_h[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h080008FF)) 
    \sec_h[2]_i_2 
       (.I0(p_0_in5_in),
        .I1(p_1_in6_in),
        .I2(key_row4_IBUF),
        .I3(set_IBUF),
        .I4(\sec_h[2]_i_3_n_0 ),
        .O(sec_h_addEn));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \sec_h[2]_i_3 
       (.I0(sec_l[0]),
        .I1(sec_l[1]),
        .I2(sec_l[3]),
        .I3(sec_l[2]),
        .O(\sec_h[2]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sec_h_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\sec_h[0]_i_1_n_0 ),
        .Q(sec_h[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sec_h_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\sec_h[1]_i_1_n_0 ),
        .Q(sec_h[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sec_h_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\sec_h[2]_i_1_n_0 ),
        .Q(sec_h[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \sec_l[0]_i_1 
       (.I0(sec_l[0]),
        .O(\sec_l[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0BF0)) 
    \sec_l[1]_i_1 
       (.I0(sec_l[2]),
        .I1(sec_l[3]),
        .I2(sec_l[1]),
        .I3(sec_l[0]),
        .O(\sec_l[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \sec_l[2]_i_1 
       (.I0(sec_l[2]),
        .I1(sec_l[0]),
        .I2(sec_l[1]),
        .O(\sec_l[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h01000000FFFFFFFF)) 
    \sec_l[3]_i_1 
       (.I0(key_row4_IBUF),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(p_0_in5_in),
        .I5(set_IBUF),
        .O(sec_l_addEn));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h68AA)) 
    \sec_l[3]_i_2 
       (.I0(sec_l[3]),
        .I1(sec_l[2]),
        .I2(sec_l[1]),
        .I3(sec_l[0]),
        .O(\sec_l[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sec_l_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(sec_l_addEn),
        .D(\sec_l[0]_i_1_n_0 ),
        .Q(sec_l[0]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sec_l_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(sec_l_addEn),
        .D(\sec_l[1]_i_1_n_0 ),
        .Q(sec_l[1]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sec_l_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(sec_l_addEn),
        .D(\sec_l[2]_i_1_n_0 ),
        .Q(sec_l[2]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sec_l_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(sec_l_addEn),
        .D(\sec_l[3]_i_2_n_0 ),
        .Q(sec_l[3]),
        .R(\FSM_sequential_state[2]_i_1_n_0 ));
  IBUF set_IBUF_inst
       (.I(set),
        .O(set_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \state_count[0]_i_1 
       (.I0(\state_count_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \state_count[1]_i_1 
       (.I0(\state_count_reg_n_0_[0] ),
        .I1(\state_count_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \state_count[2]_i_1 
       (.I0(\state_count_reg_n_0_[1] ),
        .I1(\state_count_reg_n_0_[0] ),
        .I2(\state_count_reg_n_0_[2] ),
        .O(p_0_in[2]));
  LUT2 #(
    .INIT(4'hB)) 
    \state_count[3]_i_1 
       (.I0(p_0_in5_in),
        .I1(resetn_IBUF),
        .O(\state_count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \state_count[3]_i_2 
       (.I0(\state_count_reg_n_0_[0] ),
        .I1(\state_count_reg_n_0_[1] ),
        .I2(\state_count_reg_n_0_[2] ),
        .O(p_0_in[3]));
  FDRE #(
    .INIT(1'b0)) 
    \state_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(\state_count_reg_n_0_[0] ),
        .R(\state_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(\state_count_reg_n_0_[1] ),
        .R(\state_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(\state_count_reg_n_0_[2] ),
        .R(\state_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(p_0_in5_in),
        .R(\state_count[3]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
