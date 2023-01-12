# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NO_FIFO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NO_LABEL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.BITS { PARAM_VALUE.BITS } {
	# Procedure called to update BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS { PARAM_VALUE.BITS } {
	# Procedure called to validate BITS
	return true
}

proc update_PARAM_VALUE.NO_FIFO { PARAM_VALUE.NO_FIFO } {
	# Procedure called to update NO_FIFO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NO_FIFO { PARAM_VALUE.NO_FIFO } {
	# Procedure called to validate NO_FIFO
	return true
}

proc update_PARAM_VALUE.NO_LABEL { PARAM_VALUE.NO_LABEL } {
	# Procedure called to update NO_LABEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NO_LABEL { PARAM_VALUE.NO_LABEL } {
	# Procedure called to validate NO_LABEL
	return true
}

proc update_PARAM_VALUE.WIDTH { PARAM_VALUE.WIDTH } {
	# Procedure called to update WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH { PARAM_VALUE.WIDTH } {
	# Procedure called to validate WIDTH
	return true
}


proc update_MODELPARAM_VALUE.NO_FIFO { MODELPARAM_VALUE.NO_FIFO PARAM_VALUE.NO_FIFO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NO_FIFO}] ${MODELPARAM_VALUE.NO_FIFO}
}

proc update_MODELPARAM_VALUE.NO_LABEL { MODELPARAM_VALUE.NO_LABEL PARAM_VALUE.NO_LABEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NO_LABEL}] ${MODELPARAM_VALUE.NO_LABEL}
}

proc update_MODELPARAM_VALUE.WIDTH { MODELPARAM_VALUE.WIDTH PARAM_VALUE.WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH}] ${MODELPARAM_VALUE.WIDTH}
}

proc update_MODELPARAM_VALUE.BITS { MODELPARAM_VALUE.BITS PARAM_VALUE.BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BITS}] ${MODELPARAM_VALUE.BITS}
}

