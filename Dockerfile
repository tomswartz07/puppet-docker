FROM ubuntu:14.04
MAINTAINER Tom Swartz <tom@pennmanor.net>

# Update the base system
RUN apt-get update
RUN apt-get upgrade -y

# Install base packages to enable the workflow
RUN apt-get install -y ruby git

# never install a ruby gem docs
RUN echo "gem: --no-rdoc --no-ri" >> /etc/gemrc

# Install the relevant gems
RUN gem install puppet rspec rspec-puppet puppetlabs_spec_helper puppet-lint rspec-puppet-utils rspec-puppet-augeas

# Clone GitHub tests
RUN git clone http://github.com/tomswartz07/puppet-git-hooks.git
