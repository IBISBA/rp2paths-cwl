FROM conda/miniconda3

ENV RP2PATHS_VERSION 1.0.0
ENV RP2PATHS_URL https://github.com/brsynth/rp2paths/archive/${RP2PATHS_VERSION}.zip
# Update sha256 sum for each release
ENV RP2PATHS_SHA256 f40e9f0de615e8df1428a09ca66986c055608d5f0e8805f4de650591a18910c3

# Debian Security patches
RUN apt-get update && apt-get -y dist-upgrade 
# Although graphviz is also in conda, it depends on X11 libraries in /usr/lib
# which this Docker image does not have.
# We'll sacrifize space for a duplicate install to get all the dependencies
# Tip: openjdk-8-jre needed to launch efm
RUN apt-get -y install graphviz curl unzip openjdk-8-jre
# FIXME: Is it pip's image or conda's scikit-image?
#RUN pip install -y image

RUN conda install --yes python-graphviz pydotplus lxml scikit-image pandas
RUN conda install --yes --channel rdkit rdkit
WORKDIR /tmp
# Download and "install" rp2paths, even though it has no setup.py
RUN echo "$RP2PATHS_SHA256  rp2paths.zip" > rp2paths.zip.sha256
RUN cat rp2paths.zip.sha256
RUN curl -L -o rp2paths.zip $RP2PATHS_URL && sha256sum rp2paths.zip && sha256sum -c rp2paths.zip.sha256
RUN mkdir src && cd src && unzip ../rp2paths.zip && mv * ../
RUN mv src /opt/rp2paths
# Patch in #!/ shebang if missing
RUN grep -q '^#!/' RP2paths.py || sed -i '1i #!/usr/bin/env python3' /opt/rp2paths/RP2paths.py
# Make it available on the path
RUN ln -s /opt/rp2paths/RP2paths.py /usr/local/bin/RP2paths.py
# Verify the install 
RUN RP2Paths.py --help
# Verify full execution (Note: We're NOT in /opt/rp2paths folder)
RUN RP2Paths.py all /opt/rp2paths/examples/violacein/rp2-results.csv --outdir /tmp/1 && ls /tmp/1 && rm -rf /tmp/1

# Default command is to run on /data/rp2-results.csv
# and output to /data/pathways/
# /data is a VOLUME so these can more easily be accessed
# outside the Docker container
RUN mkdir /data
VOLUME /data
WORKDIR /data
CMD ["/opt/rp2paths/RP2paths.py", "all", "rp2-results.csv", "--outdir", "pathways/"]
