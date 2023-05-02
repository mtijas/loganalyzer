FROM node:20-bullseye-slim

EXPOSE 8000

RUN useradd -ms /bin/bash loganalyzer

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

COPY ./src ./src
RUN chown -R loganalyzer:loganalyzer /app

USER loganalyzer

RUN npm install --development

CMD ["node", "src/server.js"]
