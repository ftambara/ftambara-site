FROM nginx:1.25.4-bookworm

# Copy the nginx configuration
COPY ./nginx/dev/nginx.conf /etc/nginx/nginx.conf
# Copy the website files
COPY ./site/ /www/ftambara.site/
