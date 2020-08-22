FROM centos:8.2.2004

WORKDIR /root

COPY res ./res

RUN yum install -y langpacks-zh_CN svn git gcc gcc-c++ make python3 which cronie lsof vim zip unzip openssh-server openssh-clients \
    && yum clean all \
    && mv ~/res/solarized.vim /usr/share/vim/vim80/colors/ \
    && mv ~/res/colorls.sh /etc/profile.d/ \
    && cat ~/res/vim.cnf >> /etc/vimrc \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && sed -i '$ a export HISTTIMEFORMAT="%F %T `whoami` "' /etc/bashrc

ENV LANG=zh_CN.utf8

CMD ["/usr/sbin/init"]
