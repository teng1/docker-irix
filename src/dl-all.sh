
#!/bin/bash
#
# Download and extract IRIX ISOs
localdir="irix/i"
remotedirIRIX="http://******/IRIX"


function dl_selections() {
  rm $localdir/$1
  wget $remotedirIRIX/$1 --directory-prefix=$localdir
	sed -i 's/rbpi/debian/g' $localdir/$1
}

function main() {
  cd $localdir/IRIX

  echo "Downloading IRIX 5.3..." 
  dl_selections 5.3.txt
  rm -rf $localdir/IRIX/irix53
  wget $remotedirIRIX/irix53.tgz -O - | tar -xz --directory $localdir/IRIX

  # echo "Downloading IRIX 6.2..." 
  # dl_selections 6.2.txt
  # rm -rf $localdir/IRIX/irix62
  # wget $remotedirIRIX/irix62.tgz -O - | tar -xz --directory $localdir/IRIX

  # echo "Downloading IRIX 6.3..." 
  # dl_selections 6.3.txt
  # rm -rf $localdir/IRIX/irix63
  # wget $remotedirIRIX/irix63.tgz -O - | tar -xz --directory $localdir/IRIX


  # echo "Downloading IRIX 6.5.0..." 
  # dl_selections 6.5.0.txt
  # rm -rf $localdir/IRIX/irix650
  # wget $remotedirIRIX/irix650.tgz -O - | tar -xz --directory $localdir/IRIX

  # echo "Downloading IRIX 6.5.7..." 
  # dl_selections 6.5.7.txt
  # rm -rf $localdir/IRIX/irix657
  # wget $remotedirIRIX/irix657.tgz -O - | tar -xz --directory $localdir/IRIX

  # echo "Downloading IRIX 6.5.22..." 
  # dl_selections 6.5.22.txt
  # rm -rf $localdir/IRIX/6.5.22
  # mkdir -p $localdir/IRIX/6.5.22
  # wget $remotedirIRIX/6.5.22/disc1.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22
  # wget $remotedirIRIX/6.5.22/disc2.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22
  # wget $remotedirIRIX/6.5.22/disc3.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22
  # wget $remotedirIRIX/6.5.22/apps.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22

  # echo "Downloading IRIX 6.5.30..." 
  # dl_selections 6.5.30.txt
  # rm -rf $localdir/IRIX/6.5.30
  # mkdir -p $localdir/IRIX/6.5.30
  # wget $remotedirIRIX/6.5.30/disc1.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
  # wget $remotedirIRIX/6.5.30/disc2.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
  # wget $remotedirIRIX/6.5.30/disc3.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
  # wget $remotedirIRIX/6.5.30/apps.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
  # wget $remotedirIRIX/6.5.30/capps.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30

  # echo "Downloading IRIX 6.5.x..." 
  # rm -rf $localdir/IRIX/irix65x
  # wget $remotedirIRIX/irix65x.tgz -O - | tar -xz --directory $localdir/IRIX

  # echo "Downloading MIPSPro ..." 
  # dl_selections MIPSPro.txt
  # rm -rf $localdir/IRIX/MIPSPro
  # mkdir -p $localdir/IRIX/MIPSPro/C
  # mkdir -p $localdir/IRIX/MIPSPro/C++

  # wget $remotedirIRIX/MIPSPro/"MIPSpro C++ Compiler 7.4.tar" -O - | tar -x --directory $localdir/IRIX/MIPSPro/C++
  # wget $remotedirIRIX/MIPSPro/"MIPSpro C Compiler 7.4.tar" -O - | tar -x --directory $localdir/IRIX/MIPSPro/C
}
main "$@"