FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y fortune-mod cowsay

# Copy the wisecow script
COPY wisecow.sh /wisecow.sh

# Make the script executable
RUN chmod +x /wisecow.sh

# Expose the port
EXPOSE 4499

# Run the command to start the server
CMD ["sh", "-c", "while true; do /wisecow.sh | nc -l -p 4499; done"]
