#### PULL镜像
docker pull letmehold/centos:[version]
#### 启动容器
docker run --name os -dt letmehold/centos:[version]
#### 登录容器
docker exec -ti os bash
#### 退出容器
exit
