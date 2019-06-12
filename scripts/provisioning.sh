#!/bin/bash -eu

## ユーザ追加
useradd -c 'Yuto Nihei' --groups users --create-home --no-user-group yutonihei

# root権限付与
echo 'yutonihei ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/yutonihei

# ユーザ設定
su -l zoe -c '
mkdir -m 0700 .ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjmS46v1RJRoUiRmfHpWxDaxHk1NJilYh+YZ6y2O6ScugBi3FNqJuIi0BHpvsFIbRVvXOFPRMHNuIDfFt4CRL9WZBNcqgTzJWikq5ADejF8QUQ7W3TpsgLKozPSwuNIJW065v+aqtM4MvZwPMzTxzpuDD55zKuPuW4Fpha3SxAqpa/0xK7IYVcDZHf3cx1G3q5QHxJMMGuHgFEdFKpTpLMgcVcveNcoRN0p7O6UtvY5G6u+db2M13k+mnHr/vi5qc4GH7lp6d+vcmdo3JxSUPn9hfY8kz4m1ASplYTc6coc7RVe+RVtQAg2D8Ij+A4B8o6JI8jvimvBkmvf2jq9M0h yutonihei@toshsMBP.local" > .ssh/authorized_keys
chmod 700 .ssh/authorized_keys'
