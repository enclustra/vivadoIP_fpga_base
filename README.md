# General Information

## Maintainer
Waldemar Koprek [waldemar.koprek@psi.ch]

## Authors
Oliver Bründler [oli.bruendler@gmx.ch]
Goran Marinkovic [goran.marinkovic@psi.ch]

## License
This library is published under [PSI HDL Library License](License.txt), which is [LGPL](LGPL2_1.txt) plus some additional exceptions to clarify the LGPL terms in the context of firmware development.

## Detailed Documentation
For details, refer to the [Datasheet](doc/fpga_base.pdf)

## Changelog
See [Changelog](Changelog.md)

<!-- DO NOT CHANGE FORMAT: this section is parsed to resolve dependencies -->

## Dependencies

* TCL
  * [PsiSim](https://github.com/paulscherrerinstitute/PsiSim) (2.1.0 or higher, for development only)
  * [PsiIpPackage](https://git.psi.ch/GFA/Libraries/Firmware/TCL/PsiIpPackage) (1.6.0, for development only )
  * [PsiUtil](https://git.psi.ch/GFA/Libraries/Firmware/TCL/PsiUtil) (1.2.0, for development only )
* VHDL
  * [psi\_common](https://github.com/paulscherrerinstitute/psi_common) (2.5.0 or higher)
* VivadoIp
  * [**vivadoIp\_fpga\_base**](https://git.psi.ch/GFA/Libraries/Firmware/VivadoIp/fpga_base)
  
<!-- END OF PARSED SECTION -->
  
Dependencies can also be checked out using the python script *scripts/dependencies.py*. For details, refer to the help of the script:

```
python dependencies.py -help
```

Note that the [dependencies package](https://git.psi.ch/GFA/Libraries/Firmware/Python/PsiLibDependencies) must be installed in order to run the script.


# Description
This IP-core implements basic FPGA functionality (Version readout, LED and DIP-Switches)






 