FROM gitpod/openvscode-server:latest

ENV OPENVSCODE_SERVER_ROOT="/home/.openvscode-server"
ENV OPENVSCODE="${OPENVSCODE_SERVER_ROOT}/bin/openvscode-server"
ENV SHELL="/bin/bash"

USER root
RUN \
    # Ensure resources are properly linked
    mkdir -p ${OPENVSCODE_SERVER_ROOT}/bin/resources/app && \
    mkdir -p ${OPENVSCODE_SERVER_ROOT}/bin/resources/terminal && \
    ln -sf ${OPENVSCODE_SERVER_ROOT}/resources/* ${OPENVSCODE_SERVER_ROOT}/bin/resources/ && \
    ln -sf ${OPENVSCODE_SERVER_ROOT}/resources/app/product.json ${OPENVSCODE_SERVER_ROOT}/bin/resources/app/ && \
    # Copy shell integration script
    cp ${OPENVSCODE_SERVER_ROOT}/resources/terminal/shellIntegration.bash ${OPENVSCODE_SERVER_ROOT}/bin/resources/terminal/ 2>/dev/null || true && \
    # Set proper permissions
    chown -R openvscode-server:openvscode-server ${OPENVSCODE_SERVER_ROOT} && \
    # Ensure proper permissions for resources
    chmod -R 755 ${OPENVSCODE_SERVER_ROOT}/bin/resources

USER openvscode-server

# Configure shell integration and terminal settings
RUN mkdir -p /home/openvscode-server/.local/share/code-server/User && \
    echo '{ \
    "terminal.integrated.shellIntegration.enabled": true, \
    "terminal.integrated.defaultProfile.linux": "bash", \
    "terminal.integrated.profiles.linux": { \
        "bash": { \
            "path": "/bin/bash", \
            "args": ["--login"], \
            "icon": "terminal-bash" \
        } \
    }, \
    "terminal.integrated.automationShell.linux": "/bin/bash", \
    "terminal.integrated.shellIntegration.decorationsEnabled": "both", \
    "terminal.integrated.enablePersistentSessions": false, \
    "security.workspace.trust.enabled": true, \
    "blackbox.shellMode": true, \
    "terminal.integrated.env.linux": { \
        "SHELL": "/bin/bash", \
        "TERM": "xterm-256color" \
    }, \
    "terminal.integrated.inheritEnv": true \
}' > /home/openvscode-server/.local/share/code-server/User/settings.json && \
    # Ensure shell integration directory exists
    mkdir -p ${OPENVSCODE_SERVER_ROOT}/bin/resources/terminal

# Switch to root for system installations
USER root

# Install Node.js, npm, pnpm, and pip
RUN apt-get update && \
    curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs python3-pip && \
    npm install -g pnpm

# Switch back to openvscode-server user
USER openvscode-server

SHELL ["/bin/bash", "-c"]
RUN \
    # Create a tmp dir for downloading
    tdir=/tmp/exts && mkdir -p "${tdir}" && cd "${tdir}" \
    # Download the extension
    && wget https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5886/blackboxagent-2.4.7.vsix \
    # Install the extension
    && ${OPENVSCODE} --install-extension "${tdir}/blackboxagent-2.4.7.vsix" \
    # Create extension data directory with proper permissions
    && mkdir -p /home/openvscode-server/.vscode-server/extensions \
    && chown -R openvscode-server:openvscode-server /home/openvscode-server/.vscode-server \
    # Clean up
    && rm -rf ${tdir}

# Configure bash profile for shell integration
COPY --chown=openvscode-server:openvscode-server <<-'EOF' /home/openvscode-server/.bashrc
# Shell Integration
export SHELL=/bin/bash
export TERM=xterm-256color

# Source shell integration
if [[ -f "${OPENVSCODE_SERVER_ROOT}/bin/resources/terminal/shellIntegration.bash" ]]; then
    source "${OPENVSCODE_SERVER_ROOT}/bin/resources/terminal/shellIntegration.bash"
fi

# Enable shell integration for interactive sessions
if [[ $- == *i* ]]; then
    # Set up command execution for blackbox
    export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
    shopt -s checkwinsize
fi
EOF

# Set up profile and permissions
RUN echo 'source ~/.bashrc' > ~/.profile && \
    # Give execute permissions to shell integration scripts
    chmod +x ${OPENVSCODE_SERVER_ROOT}/bin/resources/terminal/shellIntegration.bash 2>/dev/null || true && \
    # Ensure proper permissions
    chown openvscode-server:openvscode-server /home/openvscode-server/.profile && \
    # Create history file with proper permissions
    touch /home/openvscode-server/.bash_history && \
    chown openvscode-server:openvscode-server /home/openvscode-server/.bash_history
