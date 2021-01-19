#!/usr/bin/env bash
github_version=$(cat github_version.txt)
ftp_version=$(cat ftp_version.txt)
github_version=1.20.0

if [ $github_version != $ftp_version ]
then
  git clone https://$USERNAME:$TOKEN@github.com/Unicamp-OpenPower/repository-scrips.git
  cd repository-scrips/
  chmod +x empacotar-crio-deb.sh
  chmod +x empacotar-crio-rpm.sh
  sudo mv empacotar-crio-deb.sh ..
  sudo mv empacotar-crio-rpm.sh ..
  cd ..
  sudo ./empacotar-crio-deb.sh crio-$github_version.linux-ppc64le.tar.gz $github_version
  sudo ./empacotar-crio-rpm.sh crio-$github_version.linux-ppc64le.tar.gz $github_version

  lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /repository/debian/ppc64el/crio/ crio-$github_version-ppc64le.deb"
  sudo lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /repository/rpm/ppc64le/crio/ ~/rpmbuild/RPMS/ppc64le/crio-$github_version-1.ppc64le.rpm"
fi
