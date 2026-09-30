FROM node:20-alpine

# 1. 优先安装系统依赖（保证下载和运行脚本所需的依赖就绪）
RUN apk add --no-cache openssl curl gcompat bash

# 2. 保持项目代码放在专门的 /app 目录（不要放在 /tmp）
WORKDIR /app

# 3. 安装 Node.js 依赖
COPY package*.json ./
# 注意：新版本 npm 推荐使用 --omit=dev 代替 --only=production
RUN npm install --omit=dev

# 4. 复制代码文件到 /app 目录
COPY . .

# 5. 声明端口
EXPOSE 8080

# 6. 启动应用
CMD ["node", "index.js"]