# Installation Guide

### The experiment is carried out using RNNLib, therefore, you will need to install RNNLib on your PC. Please follow the following order for correct installation.

## DOI: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10526965.svg)](https://doi.org/10.5281/zenodo.10526965)

1.	The RNNLib can be downloaded and installed using the instruction given [here](https://sourceforge.net/p/rnnl/wiki/Home/)*. Once you have installed the RNNLib, use the given code (NC files Creation code) named as xyz.py to create NC files. NC files are those files which are known as Network Compatible for RNNLib. These files are made by using NETCDF library. 
2.	The rest of the process is very easy. Make sure that your NC and config files are in the same folder.  Configuration file contains the configuration of the MDLSTM network. In our case, the configuration file (i.e. transcriptionPHTI-V1.config) contains the proposed MDLSTM architecture that is published in the [article](https://doi.org/10.5281/zenodo.10526965).
3.	Go to your command terminal and navigate to the folder where your NC files and configuration files are stored and Type the following command and press Enter.

`path/to/your/folder>rnnlib <yourconfigfile.config>` 

*Note: in case of any difficulty please feel free to contact ibrar@sbbu.edu.pk
