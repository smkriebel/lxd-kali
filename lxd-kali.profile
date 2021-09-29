config:
  environment.DISPLAY: :0
  user.user-data: |
   #cloud-config
   users:
    - name: kali
      groups: sudo
      shell: "/bin/bash" 
      passwd: "$y$j9T$gu7Ufefs9OIZau7.zW1FM/$4lt7HPTYJihCSS8kPYwK5FCdcBRP7owaYgr1pujiui9"
      lock_passwd: false
   package_update: true
   package_upgrade: true
   packages:
    - apt-utils
    - kali-linux-core
   runcmd:
    - cp /etc/skel/.bashrc /home/kali/.bashrc
    - chown kali:kali /home/kali/.bashrc
    - sed -i '1 i\TERM=xterm-256color' /home/kali/.bashrc
    - echo "export DISPLAY=:0" >> /home/kali/.bashrc
    - echo 'Set disable_coredump false' >> /etc/sudo.conf
     
description: Kali LXD profile
devices:
  X0:
    bind: container
    connect: unix:@/tmp/.X11-unix/X0
    listen: unix:@/tmp/.X11-unix/X0
    security.gid: "1000"
    security.uid: "1000"
    type: proxy
