library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crc_tb is
end entity;

architecture foo of crc_tb is

  signal data_in : std_logic_vector (7 downto 0);
  signal crc_en : std_logic := '0';
  signal rst : std_logic;
  signal clk : std_logic := '0';
  signal crc_out : std_logic_vector (15 downto 0);

begin

  clk <= not clk after 10 ns;

  DUT :
  entity work.crc
    port map(
      data_in => data_in,
      crc_en => crc_en,
      rst => rst,
      clk => clk,
      crc_out => crc_out
    );

    STIMULI :
    process
    begin
      rst <= '1';
      for i in 0 to 5 loop
        wait until rising_edge(clk);
      end loop;
      rst <= '0';
      crc_en <= '1';
      for i in 1 to 15 loop
        data_in <= std_logic_vector(to_unsigned (i * 10, 8));
        if (i = 6) then
          crc_en <= '0';
        elsif (i = 8) then
          rst <= '1';
        elsif (i = 10) then

          crc_en <= '1';
        elsif (i = 11) then
          rst <= '0';
        end if;
        wait until rising_edge(clk);
      end loop;
      crc_en <= '0';
      wait until rising_edge(clk);
      wait;
    end process;
  end architecture;