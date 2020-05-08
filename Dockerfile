FROM centos:7.6.1810

WORKDIR /root

COPY res ./res

RUN yum install -y epel-release \
    && yum install -y svn git gcc gcc-c++ make python2-pip python-devel which cronie lsof vim zip unzip openssh-server openssh-clients \
    && yum clean all \
    && mv ~/res/solarized.vim /usr/share/vim/vim74/colors/ \
    && cat ~/res/vim.cnf >> /etc/vimrc \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && sed -i '$ a export HISTTIMEFORMAT="%F %T `whoami` "' /etc/bashrc

ENV LANG=zh_CN.UTF-8

CMD ["/usr/sbin/init"]
