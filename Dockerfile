# 1. 征用基础底盘
FROM python:3.9-slim

# 2. 设立前线指挥部
WORKDIR /app

# 3. 运送后勤清单
COPY requirements.txt .

# 4. 组装零件（使用清华源加速）
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

# 5. 运送核心武器
COPY . .

# 6. 暴露火力端口
EXPOSE 8000

# 7. 终极点火指令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
