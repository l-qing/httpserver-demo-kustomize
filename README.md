# Argo CD 演示程序

使用`kustomize`格式的配置清单部署`httpserver`服务。

## 使用

### 部署应用
```shell
$ kustomize build | kubectl apply -f -
```

### 替换镜像tag
> 使用`kustomize`命令替换镜像地址。
```shell
# 替换 deployment 中的镜像及tag
$ IMAGE=httpserver IMAGE_TAG=latest make update-deployment-image
```

