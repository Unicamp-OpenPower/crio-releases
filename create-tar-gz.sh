#github_version=$(cat github_version.txt)
github_version=1.19.1

mkdir -p usr/local/bin \
usr/local/share/man5 \
usr/local/share/man8 \
usr/local/share/bash-completion/completions \
usr/local/share/fish/completions \
usr/local/share/zsh/site-functions \
usr/local/share/oci-umount/oci-umount.d \
etc/cni/net.d \
etc/crio \
opt/cni/bin \
lib/systemd/system \
etc/containers

printf "[registries.search]\n\
registries = ['registry.access.redhat.com', 'registry.fedoraproject.org', 'quay.io', 'docker.io']\n\
\n\
[registries.insecure]\n\
registries = []\n\
\n\
[registries.block]\n\
registries = []\n" > etc/containers/registries.conf

cp cri-o/bin/* usr/local/bin
cp plugins/bin/* opt/cni/bin
cp cri-o/contrib/cni/10-crio-bridge.conf etc/cni/net.d
cp cri-o/crictl.yaml etc
cp cri-o/crio-umount.conf usr/local/share/oci-umount/oci-umount.d
cp cri-o/crio.conf etc/crio
cp cri-o/docs/crio.conf.5 cri-o/docs/crio.conf.d.5 usr/local/share/man5
cp cri-o/docs/crio.8 usr/local/share/man8
cp cri-o/completions/bash/crio cri-o/completions/bash/crio-status usr/local/share/bash-completion/completions
cp cri-o/completions/fish/crio.fish usr/local/share/fish/completions
cp cri-o/completions/zsh/_crio cri-o/completions/zsh/_crio-status usr/local/share/zsh/site-functions
cp cri-o/contrib/policy.json etc/containers
cp cri-o/contrib/systemd/crio.service lib/systemd/system

tar -czvf crio-$github_version.linux-ppc64le.tar.gz etc lib opt usr
