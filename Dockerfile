# Step 1: Build the app
FROM node:18 as build
WORKDIR /app
COPY devops-integration/package*.json ./
RUN npm install
COPY devops-integration/ .
RUN npm run build

# Step 2: Serve with a lightweight HTTP server (like `serve`)
FROM node:18 as prod
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/dist ./dist
EXPOSE 80
CMD ["serve", "-s", "dist", "-l", "80"]
