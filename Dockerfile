# 1. 征用基础底盘
FROM python:3.9-slim

# 2. 设立前线指挥部
WORKDIR /app

# 3. 运送后勤清单
COPY requirements.txt .

# 使用阿里云镜像源，它的稳定性在某些地区比清华源更好
# 尝试使用阿里云镜像源，并增加超时等待，防止网络波动
RUN pip install --no-cache-dir \
    -i https://mirrors.aliyun.com/pypi/simple/ \
    --trusted-host mirrors.aliyun.com \
    fastapi uvicorn

# 5. 运送核心武器
COPY . .

# 6. 暴露火力端口
EXPOSE 8000

# 7. 终极点火指令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
