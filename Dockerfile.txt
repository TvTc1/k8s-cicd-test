# 1. 征用基础底盘：极其轻量级的 Python 3.9 官方精简版镜像
FROM python:3.9-slim

# 2. 设立前线指挥部：在容器内创建一个名叫 /app 的工作目录
WORKDIR /app

# 3. 运送后勤清单：先把依赖包清单复制进容器
COPY requirements.txt .

# 4. 组装零件（极其关键！）：使用清华大学镜像源，无视火力封锁，极速下载依赖包！
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

# 5. 运送核心武器：把当前目录下的所有代码（比如 main.py）全部拷贝进容器的 /app 目录
COPY . .

# 6. 暴露火力端口：声明这个容器将在 8000 端口对外提供服务
EXPOSE 8000

# 7. 终极点火指令：容器启动时，执行这句命令来启动 FastAPI 服务
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]