
#-----------------------------------------------------------
# set up gpg and rpm to be able to resign rpms
#-----------------------------------------------------------

# install prereqs
yum install -y rpm-sign yum-utils

#--- demo key ---
## create a gpg key - note the no-protection line for passwordless keys
## ref: https://gist.github.com/woods/8970150?permalink_comment_id=4485843#gistcomment-4485843
#gpg --full-gen-key --batch <(echo "Key-Type: 1"; \
#                              echo "Key-Length: 4096"; \
#                              echo "Subkey-Type: 1"; \
#                              echo "Subkey-Length: 4096"; \
#                              echo "Expire-Date: 0"; \
#                              echo "Name-Real: weewx test key"; \
#                              echo "Name-Email: me@example.com"; \
#                              echo "%no-protection"; )

#--- or do it for real ---

# EDITME: import previously-exported secret key from mounted keys directory
gpg --import /root/keys/seckey.asc

# EDITME: edit next two lines to match the name of your desired signing key
echo "%_gpg_name weewx test key" >> ~/.rpmmacros
gpg --export -a 'weewx test key' > /tmp/keys.export

# tell rpm about it and verify
rpm --import /tmp/keys.export
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'

#----- at this point rpm will use this test key to sign rpms ---
#      cd into your working directory and run 'rpm --resign *.rpm'
#      and verify with "rpm -q *.rpm | grep Sig" to see it resigned them
#

