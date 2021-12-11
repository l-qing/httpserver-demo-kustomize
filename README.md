# Argo CD 演示程序

使用`kustomize`格式的配置清单部署`httpserver`服务。

## 使用

### 部署应用
```shell
$ kustomize build | kubectl apply -f -
```

### 替换镜像tag
> 使用`sed`命令替换镜像tag。
```shell
# 只替换 deployment 中镜像的tag
$ IMAGE_TAG=latest make update-deployment-image-tag

# 替换 deployment 中的镜像及tag
$ IMAGE=httpserver IMAGE_TAG=latest make update-deployment-image
```

