ghdl -a ../Fuentes/crc.vhd ../Fuentes/crc_tb.vhd
ghdl -s ../Fuentes/crc.vhd ../Fuentes/crc_tb.vhd
ghdl -e crc_tb
ghdl -r crc_tb --vcd=crc_tb.vcd --stop-time=530ns

gtkwave crc_tb.vcd