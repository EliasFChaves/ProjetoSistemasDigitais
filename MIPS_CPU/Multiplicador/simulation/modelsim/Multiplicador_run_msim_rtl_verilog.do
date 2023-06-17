transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/Counter {C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/Counter/Counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/CONTROL {C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/CONTROL/CONTROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/Adder {C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/Adder/Adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/ACC {C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/ACC/ACC.v}
vlog -vlog01compat -work work +incdir+C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador {C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/Multiplicador.v}

vlog -vlog01compat -work work +incdir+C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador {C:/Users/elias/OneDrive/Documentos/UNIFEI/7_Semestre/ELTD15/Multiplicador/Multiplicador_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Multiplicador_tb

add wave *
view structure
view signals
run -all
