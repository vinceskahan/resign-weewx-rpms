

cat > /etc/yum.repos.d/weewx-el7.repo <<EOF
[el7]
name=weewx7
baseurl=http://weewx.com/yum/weewx/el7
enabled=1
gpgcheck=0
EOF

cat > /etc/yum.repos.d/weewx-el8.repo <<EOF
[el8]
name=weewx8
baseurl=http://weewx.com/yum/weewx/el8
enabled=1
gpgcheck=0
EOF

mkdir -p /root/repos
cd /root/repos

echo "............... el7 repo ............"
reposync --disablerepo=\* --enablerepo=el7
#ls /root/repos/el7/RPMS -al

echo "............... el8 repo ............"
reposync --disablerepo=\* --enablerepo=el8
#ls /root/repos/el8/RPMS -al

echo ".............. done ..............."

