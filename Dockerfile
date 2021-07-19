FROM	ubuntu:20.04

RUN	set -x \
	# Install the needed packages:
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install \
		--no-install-recommends --assume-yes \
		# Basic tex
		texlive \
		# Moderncv
		texlive-latex-extra \
		# Font Awesome
		texlive-fonts-extra \
		# Scalable font
		cm-super \
	&& rm -rf /var/lib/apt/lists/*
