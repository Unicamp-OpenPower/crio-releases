github_version=$(cat github_version.txt)
ftp_version=$(cat ftp_version.txt)
del_version=$(cat delete_version.txt)

#ALTERAR == POR !=
if [ $github_version == $ftp_version ]
then
  git clone https://github.com/cri-o/cri-o.git
  cd cri-o/
  make
  cd ..
  git clone https://github.com/containernetworking/plugins
  cd plugins
  git checkout v0.8.7
  ./build_linux.sh
  cd ..
  bash create-tar-gz.sh
  ls

  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; rm /ppc64el/crio/latest/crio-$ftp_version.linux-ppc64le.tar.gz"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/crio/latest crio-$github_version.linux-ppc64le.tar.gz"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/crio crio-$github_version.linux-ppc64le.tar.gz"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; rm /ppc64el/crio/crio-$del_version.linux-ppc64le.tar.gz"
fi
