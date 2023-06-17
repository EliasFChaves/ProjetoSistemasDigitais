transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Counter {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Counter/Counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/CONTROL {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/CONTROL/CONTROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Adder {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Adder/Adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/ACC {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/ACC/ACC.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador {C:/Users/elias/Documents/GitHub/ProjetoSistemasDigitais/MIPS_CPU/Multiplicador/Multiplicador.v}

