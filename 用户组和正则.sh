#复制/etc/skel目录为/home/tuser1，要求/home/tuser1及其内部文件的属组和其它用户均没有任何访问权限。
[root@centos ~]# cp -r /etc/skel /home/tuser1
[root@centos ~]# ls -aldh /home/tuser1/
[root@centos ~]# chmod -R 700 /home/tuser1/
[root@centos ~]# ls -adlh /home/tuser1/

#编辑/etc/group文件，添加组hadoop
[root@centos ~]# echo "hadoop:x:3005:" >> /etc/group
[root@centos ~]# echo "hadoop:\!::" >> /etc/gshadow
[root@centos ~]# groups hadoop
groups: hadop: No such user
[root@centos ~]# useradd hadoopuser -G hadoop

#手动编辑/etc/passwd文件新增一行，添加用户hadoop，其基本组ID为hadoop组的id号；其家目录为/home/ha
#doop。
[root@centos ~]# echo "hadop:x:4000:3005::/home/hadoop" >> /etc/passwd
[root@centos home]# echo "hadoop:\!\!:17002:0:7:::" >> /etc/shadow
[root@centos ~]# id hadop

#复制/etc/skel目录为/home/hadoop，要求修改hadoop目录的属组和其它用户没有任何访问权限
[root@centos ~]# cp -r /etc/skel /home/hadoop && chmod 700 /home/hadoop
[root@centos ~]# ls -adl /home/hadoop/

#修改/home/hadoop目录及其内部所有文件的属主为hadoop，属组为hadoop
[root@centos ~]# chown hadoop:hadoop -R /home/hadoop
[root@centos ~]# ls -alh /home/hadoop/

#显示/proc/meminfo文件中以大写或小写S开头的行；用两种方式；
[root@centos ~]# grep -i "^s" /proc/meminfo
[root@centos ~]# grep "^[Ss]" /proc/meminfo


#显示/etc/passwd文件中其默认shell为非/sbin/nologin的用户
[root@centos ~]# grep -v "/sbin/nologin" /etc/passwd | cut -d: -f1

#显示/etc/passwd文件中其默认shell为/bin/bash的用户
[root@centos ~]# grep "/bin/bash" /etc/passwd | cut -d: -f1

#找出/etc/passwd文件中的一位数或两位数
[root@centos ~]# grep -o "[[:digit:]]\{1,2\}" /etc/passwd

#显示/boot/grub/grub.conf中以至少一个空白字符开头的行
[root@centos ~]# grep "^[[:space:]]\+" /boot/grub/grub.conf

#显示/etc/rc.d/rc.sysinit文件中以#开头，后面跟至少一个空白字符，而后又有至少一个非空白字符的行
[root@centos ~]# grep "^#[[:space:]]\+[^[:space:]]" /etc/rc.d/rc.sysinit

#打出netstat -tan命令执行结果中以‘LISTEN’，后或跟空白字符结尾的行
[root@centos ~]# netstat -tan | grep "LISTEN[[:space:]]*$"

#添加用户bash, testbash, basher, nologin (此一个用户的shell为/sbin/nologin)，而后找出当前系统上其用户名和默认shell相同的用户的信息
[root@centos ~]# useradd -s /sbin/nologin bash
[root@centos ~]# useradd testbash
[root@centos ~]# useradd basher
[root@centos ~]# useradd nologin
[root@centos ~]# grep "^\([[:alnum:]]\+\>\).*\1$" /etc/passwd

#显示/proc/meminfo文件中以大写或小写S开头的行；用三种方式
[root@centos ~]# grep -i "^S" /proc/meminfo
[root@centos ~]# sed -n '/^[sS]/p' /proc/meminfo
[root@centos ~]# grep "^[Ss]" /proc/meminfo

#显示/etc/passwd文件中其默认shell为非/sbin/nologin的用户
[root@centos ~]# grep -v "/sbin/nologin" /etc/passwd | cut -d: -f1

#显示/etc/passwd文件中其默认shell为/bin/bash的用户
[root@centos ~]# grep "/bin/bash" /etc/passwd | cut -d: -f1

#找出/etc/passwd文件中的一位数或两位数
[root@centos ~]# grep -o "[[:digit:]]\{1,2\}" /etc/passwd