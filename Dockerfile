# Build stage
FROM node:18 AS build
WORKDIR /app

COPY devops-integration/package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Serve using 'serve'
RUN npm install -g serve

EXPOSE 80
CMD ["serve", "-s", "dist", "-l", "80"]
