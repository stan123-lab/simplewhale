FROM nginx:alpine
COPY static /usr/share/nginx/html
# Twistlock Container Defender - app embedded
ADD twistlock_defender_app_embedded.tar.gz /tmp
ENV DEFENDER_TYPE="appEmbedded"
ENV DEFENDER_APP_ID="simplewhale"
ENV FILESYSTEM_MONITORING="false"
ENV WS_ADDRESS="wss://us-east1.cloud.twistlock.com:443"
ENV DATA_FOLDER="/tmp"
ENV INSTALL_BUNDLE="eyJzZWNyZXRzIjp7InNlcnZpY2UtcGFyYW1ldGVyIjoiL1QxV1N6ZExGWlRKdnBoZHNyWnJoOEZTM3psbGh6VWZmbHlzdGxDb2p3MkI0NnNuSlFoTGRFZmYvbW5ZNWpTSUthSHBJUllzSkx4czJST0FaRmZZYnc9PSJ9LCJnbG9iYWxQcm94eU9wdCI6eyJodHRwUHJveHkiOiIiLCJub1Byb3h5IjoiIiwiY2EiOiIiLCJ1c2VyIjoiIiwicGFzc3dvcmQiOnsiZW5jcnlwdGVkIjoiIn19LCJjdXN0b21lcklEIjoidXMtMi0xNTgyODg1MDQiLCJhcGlLZXkiOiJEbHQxRzhjTDBubXlhNVR5SjVqZnkwTFFQSHJ1N25Td0JlK1JJTEVpcDdsUXdacEFGSk41VXdMYlRlZWUzUjVPWDA3eit4cU94RVg4UlI1K0Q1dGF2QT09IiwibWljcm9zZWdDb21wYXRpYmxlIjpmYWxzZSwiaW1hZ2VTY2FuSUQiOiIxNWQ0ZjdmYi00YTc3LWVlMjMtMjU0Yi1jMmJhZjYxNTAzZDAifQ=="
ENTRYPOINT ["/tmp/defender", "app-embedded", "nginx -g 'daemon off;'"]