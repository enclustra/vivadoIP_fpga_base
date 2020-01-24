# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Configuration [ipgui::add_page $IPINST -name "Configuration"]
  ipgui::add_param $IPINST -name "C_VERSION" -parent ${Configuration}
  ipgui::add_param $IPINST -name "C_VERSION_MAJOR" -parent ${Configuration}
  ipgui::add_param $IPINST -name "C_VERSION_MINOR" -parent ${Configuration}
  ipgui::add_param $IPINST -name "C_USE_INFO_FROM_SCRIPT" -parent ${Configuration}


}

proc update_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to update C_S00_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to validate C_S00_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_USE_INFO_FROM_SCRIPT { PARAM_VALUE.C_USE_INFO_FROM_SCRIPT } {
	# Procedure called to update C_USE_INFO_FROM_SCRIPT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_INFO_FROM_SCRIPT { PARAM_VALUE.C_USE_INFO_FROM_SCRIPT } {
	# Procedure called to validate C_USE_INFO_FROM_SCRIPT
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

proc update_MODELPARAM_VALUE.C_USE_INFO_FROM_SCRIPT { MODELPARAM_VALUE.C_USE_INFO_FROM_SCRIPT PARAM_VALUE.C_USE_INFO_FROM_SCRIPT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_INFO_FROM_SCRIPT}] ${MODELPARAM_VALUE.C_USE_INFO_FROM_SCRIPT}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH}
}

