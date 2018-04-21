FROM nginx:1.13.9

# Setup directories
RUN mkdir -p /app/dehydrated
RUN mkdir -p /etc/dehydrated

# ---------------------------------------------------------
# Install required dependencies:
#
# ca-certificates       Required for git and pip (and other things downloading over https/ssl (?)).
# cron                  Used to periodically check and update SSL certificates.
# curl                  Required by the Dehydrated client.
# git                   For downloading the Dehydrated client.
# python-setuptools     Contains easy_install, which is used to install pip.
# ---------------------------------------------------------
RUN apt-get update
RUN apt-get install -y ca-certificates cron curl git python-setuptools

# ---------------------------------------------------------
# Install the dehydrated client. Note this checks out a 
# specific commit. Update checkout command as needed.
# ---------------------------------------------------------
WORKDIR /app/dehydrated
RUN git clone -n https://github.com/lukas2511/dehydrated.git ./
RUN git checkout c0bcf91

# ---------------------------------------------------------
# Install python libraries:
#   - requests
#   - dns-lexicon (allows interaction with cloudflare api)
# ---------------------------------------------------------
RUN easy_install pip
RUN pip install requests[security]
RUN pip install dns-lexicon

# Copy crontab
COPY ./crontab /etc/crontab

# Setup cron
RUN crontab /etc/crontab
RUN touch /var/log/cron

# Copy startup script
COPY ./startup.sh /app/startup.sh

# Startup command
CMD [ "/app/startup.sh" ]
