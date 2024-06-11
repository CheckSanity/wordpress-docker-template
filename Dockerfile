FROM wordpress:6.4-php8.0

# Copy the script and set permissions
COPY ./init/prep.sh /prep.sh
RUN chmod +x /prep.sh
