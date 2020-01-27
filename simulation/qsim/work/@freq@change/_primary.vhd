library verilog;
use verilog.vl_types.all;
entity FreqChange is
    port(
        clk_in          : in     vl_logic;
        clk_out         : out    vl_logic
    );
end FreqChange;
