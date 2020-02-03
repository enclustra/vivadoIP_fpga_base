# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Configuration [ipgui::add_page $IPINST -name "Configuration"]
  ipgui::add_param $IPINST -name "C_VERSION" -parent ${Configuration}
  ipgui::add_param $IPINST -name "C_VERSION_MAJOR" -parent ${Configuration}
  ipgui::add_param $IPINST -name "C_VERSION_MINOR" -parent ${Configuration}
  ipgui::add_param $IPINST -name "C_FREQ_AXI_CLK_HZ" -parent ${Configuration}
  ipgui::add_param $IPINST -name "C_FREQ_BLINKING_LED_HZ" -parent ${Configuration}
  ipgui::add_param $IPINST -name "IMPL_BLINK" -parent ${Configuration}
  ipgui::add_param $IPINST -name "IMPL_SWITCH" -parent ${Configuration}
  ipgui::add_param $IPINST -name "IMPL_LED" -parent ${Configuration}


}

proc update_PARAM_VALUE.C_FREQ_AXI_CLK_HZ { PARAM_VALUE.C_FREQ_AXI_CLK_HZ } {
	# Procedure called to update C_FREQ_AXI_CLK_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_FREQ_AXI_CLK_HZ { PARAM_VALUE.C_FREQ_AXI_CLK_HZ } {
	# Procedure called to validate C_FREQ_AXI_CLK_HZ
	return true
}

proc update_PARAM_VALUE.C_FREQ_BLINKING_LED_HZ { PARAM_VALUE.C_FREQ_BLINKING_LED_HZ } {
	# Procedure called to update C_FREQ_BLINKING_LED_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_FREQ_BLINKING_LED_HZ { PARAM_VALUE.C_FREQ_BLINKING_LED_HZ } {
	# Procedure called to validate C_FREQ_BLINKING_LED_HZ
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to update C_S00_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to validate C_S00_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_VERSION { PARAM_VALUE.C_VERSION } {
	# Procedure called to update C_VERSION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_VERSION { PARAM_VALUE.C_VERSION } {
	# Procedure called to validate C_VERSION
	return true
}

proc update_PARAM_VALUE.C_VERSION_MAJOR { PARAM_VALUE.C_VERSION_MAJOR } {
	# Procedure called to update C_VERSION_MAJOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_VERSION_MAJOR { PARAM_VALUE.C_VERSION_MAJOR } {
	# Procedure called to validate C_VERSION_MAJOR
	return true
}

proc update_PARAM_VALUE.C_VERSION_MINOR { PARAM_VALUE.C_VERSION_MINOR } {
	# Procedure called to update C_VERSION_MINOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_VERSION_MINOR { PARAM_VALUE.C_VERSION_MINOR } {
	# Procedure called to validate C_VERSION_MINOR
	return true
}

proc update_PARAM_VALUE.IMPL_BLINK { PARAM_VALUE.IMPL_BLINK } {
	# Procedure called to update IMPL_BLINK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMPL_BLINK { PARAM_VALUE.IMPL_BLINK } {
	# Procedure called to validate IMPL_BLINK
	return true
}

proc update_PARAM_VALUE.IMPL_LED { PARAM_VALUE.IMPL_LED } {
	# Procedure called to update IMPL_LED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMPL_LED { PARAM_VALUE.IMPL_LED } {
	# Procedure called to validate IMPL_LED
	return true
}

proc update_PARAM_VALUE.IMPL_SWITCH { PARAM_VALUE.IMPL_SWITCH } {
	# Procedure called to update IMPL_SWITCH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMPL_SWITCH { PARAM_VALUE.IMPL_SWITCH } {
	# Procedure called to validate IMPL_SWITCH
	return true
}


proc update_MODELPARAM_VALUE.C_VERSION { MODELPARAM_VALUE.C_VERSION PARAM_VALUE.C_VERSION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_VERSION}] ${MODELPARAM_VALUE.C_VERSION}
}

proc update_MODELPARAM_VALUE.C_VERSION_MAJOR { MODELPARAM_VALUE.C_VERSION_MAJOR PARAM_VALUE.C_VERSION_MAJOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_VERSION_MAJOR}] ${MODELPARAM_VALUE.C_VERSION_MAJOR}
}

proc update_MODELPARAM_VALUE.C_VERSION_MINOR { MODELPARAM_VALUE.C_VERSION_MINOR PARAM_VALUE.C_VERSION_MINOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_VERSION_MINOR}] ${MODELPARAM_VALUE.C_VERSION_MINOR}
}

proc update_MODELPARAM_VALUE.C_FREQ_AXI_CLK_HZ { MODELPARAM_VALUE.C_FREQ_AXI_CLK_HZ PARAM_VALUE.C_FREQ_AXI_CLK_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_FREQ_AXI_CLK_HZ}] ${MODELPARAM_VALUE.C_FREQ_AXI_CLK_HZ}
}

proc update_MODELPARAM_VALUE.C_FREQ_BLINKING_LED_HZ { MODELPARAM_VALUE.C_FREQ_BLINKING_LED_HZ PARAM_VALUE.C_FREQ_BLINKING_LED_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_FREQ_BLINKING_LED_HZ}] ${MODELPARAM_VALUE.C_FREQ_BLINKING_LED_HZ}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH}
}

