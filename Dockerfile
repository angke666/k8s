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

# 暴露端口
EXPOSE 8080

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--server.port=8080"]