FROM node:20-alpine

# 1. 安装基础依赖
RUN apk add --no-cache openssl gcompat bash

# 2. 设置项目工作目录
WORKDIR /app

# 3. 安装 Node.js 依赖
COPY package*.json ./
RUN npm install --omit=dev

# 4. 复制代码文件到 /app 目录
COPY . .

# 5. 给 web 可执行文件赋予执行权限
RUN chmod +x /app/web

# 6. 声明端口
EXPOSE 3000

# 7. 启动应用
CMD ["node", "index.js"]