library verilog;
use verilog.vl_types.all;
entity ToneGenerator is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        tone            : out    vl_logic_vector(6 downto 0)
    );
end ToneGenerator;
