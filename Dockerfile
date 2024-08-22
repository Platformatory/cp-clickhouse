FROM confluentinc/cp-kafka:latest

# Copy the Kafka producer script into the container
COPY produce_data.sh /opt/produce_data.sh

# Ensure the script is executable
RUN chmod +x /opt/produce_data.sh

# Set the default command to execute the script
CMD ["/opt/produce_data.sh", "500"]

