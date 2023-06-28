transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

<<<<<<< Updated upstream
vlog -vlog01compat -work work +incdir+C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/Counter {C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/Counter/Counter.v}
vlog -vlog01compat -work work +incdir+C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/CONTROL {C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/CONTROL/CONTROL.v}
vlog -vlog01compat -work work +incdir+C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/Adder {C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/Adder/Adder.v}
vlog -vlog01compat -work work +incdir+C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/ACC {C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/ACC/ACC.v}
vlog -vlog01compat -work work +incdir+C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador {C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/Multiplicador.v}

vlog -vlog01compat -work work +incdir+C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador {C:/Quartus/MIPS_CPU/MIPS_CPU/Multiplicador/Multiplicador_TB.v}
=======
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Counter {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Counter/Counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/CONTROL {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/CONTROL/CONTROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Adder {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Adder/Adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/ACC {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/ACC/ACC.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Multiplicador.v}

vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Multiplicador_TB.v}
>>>>>>> Stashed changes

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  Multiplicador_TB

add wave *
view structure
view signals
run -all
