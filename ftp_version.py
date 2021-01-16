import requests
# find and save the current Github release
html = str(
    requests.get('https://github.com/cri-o/cri-o/releases/latest')
    .content)
index = html.find('CRI-O v')
github_version = html[index + 7:index + 13]
file = open('github_version.txt', 'w')
file.writelines(github_version)
file.close()

# find and save the current Bazel version on FTP server
html = str(
    requests.get(
        'https://oplab9.parqtec.unicamp.br/pub/ppc64el/crio/latest'
    ).content)
index = html.rfind('crio-')
ftp_version = html[index + 5:index + 11]
file = open('ftp_version.txt', 'w')
file.writelines(ftp_version)
file.close()

# find and save the oldest Bazel version on FTP server
html = str(
    requests.get(
        'https://oplab9.parqtec.unicamp.br/pub/ppc64el/crio'
    ).content)
index = html.find('crio-')
delete = html[index + 5:index + 11]
file = open('delete_version.txt', 'w')
file.writelines(delete)
file.close()
