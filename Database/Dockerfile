# Use the official MySQL image
FROM mysql:latest

# Expose MySQL default port
EXPOSE 3306

# No initialization scripts or optional steps are included here
COPY init.sql /docker-entrypoint-initdb.d/
