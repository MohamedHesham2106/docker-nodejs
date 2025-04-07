# Stage 1: Install
FROM node:18 as installer
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Run
FROM node:18-alpine
WORKDIR /app
COPY --from=installer /app .
EXPOSE 3000
CMD ["node", "src/app.js"]
