FROM mcr.microsoft.com/devcontainers/base:focal

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    libgdiplus \
    postgresql-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install .NET Core 3.1
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 3.1 --install-dir /usr/share/dotnet