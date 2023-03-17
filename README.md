# Dockerfile

```bash
# registry-vpc.cn-beijing.aliyuncs.com
# registry-internal.cn-beijing.aliyuncs.com
REGISTRY=registry.cn-beijing.aliyuncs.com
NAMESPACE=licsber
REPO_NAME=github
LABEL=lede
sudo docker pull "$REGISTRY/$NAMESPACE/$REPO_NAME:$LABEL"
```
