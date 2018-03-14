#!/bin/bash
yum install epel-release nano curl wget git htop tmux -y
cat /dev/zero | ssh-keygen -b 4096 -t rsa -q -N ""
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEArPgT5NSh12i9wgKB5730QS+1lXAK8aRIz8+yXYZm6siekNXLIVznmFNKgdKeO3YSyzj7QcR+j/KaigNw3bYDKtbM4E66ywwpOIfWb2sggT7e9llFS7ho1PwrWqYuRUL+b+SoX6IibIy2HlgQ9ZZt0F/VyGH7Lr/aV1/+Ay+YuTQK4LCseyuPiZe1CPa1nHfJsNMyZ39gnLCWBOvKYf0pOzp48hXElae7z4OitFGzC3n7rYR+AHnz65JYwFvV9foTTAdtv2j9mVW06w9FSPCvYzRHRiDaxXmV5dXk4p0P/APhlsSbWcrhysEBovXrGLxNYCZ8kyobjAPxEavX27itUQ== EKB-OSUB-0014' >> ~/.ssh/authorized_keys
yum upgrade -y