# Dockerfile

Thanks AliYun.

```bash
# registry-vpc.cn-beijing.aliyuncs.com
# registry-internal.cn-beijing.aliyuncs.com
REGISTRY=registry.cn-beijing.aliyuncs.com
NAMESPACE=licsber
REPO_NAME=github
LABEL=openwrt-x86
sudo docker pull "$REGISTRY/$NAMESPACE/$REPO_NAME:$LABEL"
```
