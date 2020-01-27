library verilog;
use verilog.vl_types.all;
entity ToneGenerator_vlg_check_tst is
    port(
        tone            : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end ToneGenerator_vlg_check_tst;
