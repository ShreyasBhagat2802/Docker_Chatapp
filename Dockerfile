FROM python:3.10

WORKDIR /app

# Set build-time argument
#ARG MYSQL_ROOT_PASSWORD
#ARG DB_NAME
#ARG DB_USER
#ARG DB_PASSWORD
#ARG DB_HOST
#ARG DB_PORT

# Set environment variables (so they persist at runtime)
#ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
#ENV DB_NAME=${DB_NAME}
#ENV DB_USER=${DB_USER}
#ENV DB_PASSWORD=${DB_PASSWORD}
#ENV DB_HOST=${DB_HOST}
#ENV DB_PORT=${DB_PORT}


# Copy the project files
#COPY . .
RUN git clone https://github.com/ShreyasBhagat2802/Chatapp_CodeDeploy.git /app
RUN echo $DB_HOST

# Install dependencies
RUN pip3 install --no-cache-dir django mysqlclient
RUN pip3 install --no-cache-dir -r requirements.txt

# Run migrations during the build process
# Wait for MySQL to be ready before migrating
#RUN python3 fundoo/manage.py migrate

# Expose the port Django runs on
EXPOSE 8000

# Start the Django server
#CMD ["python3", "fundoo/manage.py", "runserver", "0.0.0.0:8000"]
CMD ["bash", "-c", "cd fundoo && python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]
