FROM amazonlinux:2023

WORKDIR /app

# .NET environment setup scripts
ENV USE_DOTNET_6="source /app/scripts/use_dotnet_6.sh"

# Copy the script into the container
COPY scripts/use_dotnet_6.sh /app/scripts/use_dotnet_6.sh

# Test script to verify environment variables
RUN echo '#!/bin/bash' > /app/test_env.sh && \
# one need to run below line either way
    # echo 'source /app/scripts/use_dotnet_6.sh' >> /app/test_env.sh && \ 
    echo 'env' >> /app/test_env.sh && \
    chmod +x /app/test_env.sh

# Command to run the test script
CMD ["/app/test_env.sh"]
