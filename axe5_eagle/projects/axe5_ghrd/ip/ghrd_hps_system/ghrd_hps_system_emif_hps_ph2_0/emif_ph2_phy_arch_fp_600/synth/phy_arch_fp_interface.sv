// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`ifndef PHY_ARCH_FP_INTERFACE

`define PHY_ARCH_FP_INTERFACE 1

// altera message_off 18455
interface AXI_BUS #(
  parameter int signed PORT_AXI_AXADDR_WIDTH  = 0,
  parameter int signed PORT_AXI_AXID_WIDTH    = 0,
  parameter int signed PORT_AXI_AXBURST_WIDTH = 0,
  parameter int signed PORT_AXI_AXLEN_WIDTH   = 0,
  parameter int signed PORT_AXI_AXSIZE_WIDTH  = 0,
  parameter int signed PORT_AXI_AXUSER_WIDTH  = 0,
  parameter int signed PORT_AXI_DATA_WIDTH    = 0,
  parameter int signed PORT_AXI_STRB_WIDTH    = 0,
  parameter int signed PORT_AXI_RESP_WIDTH    = 0,
  parameter int signed PORT_AXI_ID_WIDTH      = 0,
  parameter int signed PORT_AXI_USER_WIDTH    = 0,
  parameter int signed PORT_AXI_AXQOS_WIDTH   = 0,
  parameter int signed PORT_AXI_AXCACHE_WIDTH = 0,
  parameter int signed PORT_AXI_AXPROT_WIDTH  = 0
);

typedef logic [PORT_AXI_AXADDR_WIDTH-1:0]  addr_t;
typedef logic [PORT_AXI_AXID_WIDTH-1:0]    id_t;
typedef logic [PORT_AXI_AXBURST_WIDTH-1:0] burst_t;
typedef logic [PORT_AXI_AXLEN_WIDTH-1:0]   len_t;
typedef logic [PORT_AXI_AXSIZE_WIDTH-1:0]  size_t;
typedef logic [PORT_AXI_AXUSER_WIDTH-1:0]  user_t;
typedef logic [PORT_AXI_DATA_WIDTH-1:0]    data_t;
typedef logic [PORT_AXI_STRB_WIDTH-1:0]    strb_t;
typedef logic [PORT_AXI_RESP_WIDTH-1:0]    resp_t;
typedef logic [PORT_AXI_ID_WIDTH-1:0]      respid_t;
typedef logic [PORT_AXI_USER_WIDTH-1:0]    respuser_t;
typedef logic [PORT_AXI_AXQOS_WIDTH-1:0]   qos_t;
typedef logic [PORT_AXI_AXCACHE_WIDTH-1:0] cache_t;
typedef logic [PORT_AXI_AXPROT_WIDTH-1:0]  prot_t;

id_t              awid;
addr_t            awaddr;
len_t             awlen;
size_t            awsize;
burst_t           awburst;
logic             awlock;
cache_t           awcache;
prot_t            awprot;
qos_t             awqos;
user_t            awuser;
logic             awvalid;
logic             awready;

data_t            wdata;
strb_t            wstrb;
logic             wlast;
respuser_t        wuser;
logic             wvalid;
logic             wready;

respid_t          bid;
resp_t            bresp;
respuser_t        buser;
logic             bvalid;
logic             bready;

id_t              arid;
addr_t            araddr;
len_t             arlen;
size_t            arsize;
burst_t           arburst;
logic             arlock;
cache_t           arcache;
prot_t            arprot;
qos_t             arqos;
user_t            aruser;
logic             arvalid;
logic             arready;

respid_t          rid;
data_t            rdata;
resp_t            rresp;
logic             rlast;
respuser_t        ruser;
logic             rvalid;
logic             rready;

modport Manager (
   output awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awqos, awuser, awvalid, input awready,
   output wdata, wstrb, wlast, wuser, wvalid, input wready,
   input bid, bresp, buser, bvalid, output bready,
   output arid, araddr, arlen, arsize, arburst, arlock, arcache, arprot, arqos, aruser, arvalid, input arready,
   input rid, rdata, rresp, rlast, ruser, rvalid, output rready
);

modport Subordinate (
   input awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awqos, awuser, awvalid, output awready,
   input wdata, wstrb, wlast, wuser, wvalid, output wready,
   output bid, bresp, buser, bvalid, input bready,
   input arid, araddr, arlen, arsize, arburst, arlock, arcache, arprot, arqos, aruser, arvalid, output arready,
   output rid, rdata, rresp, rlast, ruser, rvalid, input rready
);

endinterface

`endif 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SA0ZAxmXF7rDJejNgM2v4IYh5/ll6i3EKLuEuOkUGdIl/l9FmtQvIkd0lcXPgkROe7+QQl5zqy7SdZ+Xn8t7eIBgVQ+GVx+KGoSPY8hwvAVeZt5IZ3m5b+kXdYHvT7WVEzwkAgV+LOFUVL+ANb9WF+63neLxZWhGG3E81XoYwgfocbylhF4xmwbKdRdhhAPoHBalvRTP7Ogp509ptpIcaMwwku8h5Fl9YYthCL/aiMuxvROs2XEoVw2B9h5IhtSo2VUFILK2XrzbKCfYlVtyeQWYasTZJpfz+VNMEkOSJjdDNUGZTn8kmYlEqU2tjave/lg6xAoPEVQRPx/4sw4yiWY1noe3EZDResUeE42S5T1p5LvQaeSF53AHZiHpUx5zFBWs63bG0xU8Uk3YA+WKERLiJr3ZtAR+kG28g7TXrMkoS6Ip6MPYXxM/YMdBYmzKl9ttr6f6j0N3iT3ciaccFlOIGyKuqrb68CrZWGPxQtVYdUNJog2MZhftXCUPikoDcnFwVIyKa/At3qjkTRlC5HuB10zKVC7O1KIpi7m6hA8waSUFOgqbPxFFhXCi+lKPmF4sIWRwK++fRSuILYeEOyi16AnM7EKk1q7e/vCmZ50R+ZQTiydzHBwAE0rTErdoeyiJ3enuuNPc5MEoBVaNGHSvjsJRpHrbTwChom0k6zES4YJeIdCV488mNz62OxPJCtGtdsgQTDtflh3AYd1OcHWmEwIv1IK/e5pBnDHGdxzdjfxWL+Pao2qkX18uqea7L5OMVmI04E3iT5JcodPuEGM2rio+OEjK7yt+7XMP8cw6BW7VK9jMwprpSRr+gQEHlvnAAkClUhoqTmJcXKcKtC0whu4Vk2LTZSFkMKc7odLKOYeTCtBSMNQf6+UYFRYeDi4j0Qf4zFQO8tvQpy89um65/FWztXEkxqHdDfXkvnzntk24RAtmfF8V7MLPtiV3aborD5001R8NXVKaFrB3PNXhYBZKSML0SqNALH+szlByFuUfBJnYjP3OIERnEZrP"
`endif