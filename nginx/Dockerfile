FROM nginx:1.25.4-bookworm

# Obtain DH parameters
RUN curl https://ssl-config.mozilla.org/ffdhe2048.txt > /dhparam.pem
RUN chmod 644 /dhparam.pem

# Copy the nginx configuration
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
# Copy the website files
COPY ./site/ /www/ftambara.site/
