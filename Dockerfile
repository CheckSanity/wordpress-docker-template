FROM wordpress:6.5.5-php8.1

# Copy the script and set permissions
COPY ./init/prep.sh /prep.sh
RUN chmod +x /prep.sh
