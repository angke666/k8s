# 使用Java8作为基础镜像
FROM java:8
# 指定作者
MAINTAINER qianjin

# 复制jar包到容器中并命名为app.jar
ADD target/k8s-v1.1.jar /app.jar
# 这句可有可有可无，就是上面add的意思，把jar包复制到容器中
#RUN bash -c 'touch /app.jar'

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 指定挂载点，让容器的这个目录能持久化存储，容器要存的文件都在这个路径里面。其他容器也可以共享该目录，只需其他容器在启动时指定即可（-volume-from 容器ID/镜像名称）
# 这个和启动容器时的-v命令不同的是，-v是可以指定宿主机文件或目录替代容器中文件或目录。相当于-v指定的地址就是容器持久化的地址，VOLUME 则是把设置的目录里的数据保存在宿主机的/var/lib/docker/volumes中
# https://blog.csdn.net/qq_21259459/article/details/98211447
#VOLUME /data

# 暴露端口
EXPOSE 8080

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--server.port=8080"]