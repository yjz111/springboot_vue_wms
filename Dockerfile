# 基础镜像
FROM hub.c.163.com/housan993/centos7_jdk8:latest
# 维护人信息
MAINTAINER yaojizhe <yaodezhanghao@gmail.com>
# 安装nginx
RUN yum -y install nginx
# 将jar包添加到容器中并更名为app.jar
ADD wms-0.0.1-SNAPSHOT.jar app.jar
# 把自己本地的html里放的前端项目，放入nginx默认的资源目录里
#COPY dist /usr/share/nginx/html
# 将自己的nginx.conf 配置文件放到docker里nginx默认的配置文件位置
#COPY nginx.conf /etc/nginx/nginx.conf
# 暴露80端口
EXPOSE 80
# 运行jar包，ENTRYPOINT这条命令只能出现一次，如有多条，则只执行最后一条。该命令只有容器启动时才执行
CMD java -jar demo-0.0.1-SNAPSHOT.jar

# springboot启动:依赖 mysql, jdk1.8的环境
# 前端 依赖vue、nginx