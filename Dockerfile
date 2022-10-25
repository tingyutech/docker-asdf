FROM debian:11

RUN apt-get -y update && \
  apt-get -y install curl git bash ca-certificates jq && \
  rm -rf /var/lib/apt/lists/* && \
  git config --global advice.detachedHead false && \
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2 && \
  echo '. $HOME/.asdf/asdf.sh' >> /root/.bashrc && \
  echo '. $HOME/.asdf/completions/asdf.bash' >> /root/.bashrc

ENV PATH="/root/.asdf/shims:/root/.asdf/bin:${PATH}"

WORKDIR /iac

RUN asdf plugin-add tanka https://github.com/trotttrotttrott/asdf-tanka.git && \
  asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git && \
  asdf plugin-add jb https://github.com/beardix/asdf-jb.git && \
  asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git && \
  asdf install tanka 0.22.1 && \
  asdf install tanka 0.23.1 && \
  asdf install kubectl 1.16.9 && \
  asdf install kubectl 1.24.1 && \
  asdf install jb 0.5.1 && \
  asdf install helm 3.10.1
