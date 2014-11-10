FROM socrata/base

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git python-pip
RUN pip install boto botocore python-daemon
RUN mkdir /tmp/build
RUN cd /tmp/build; git clone https://github.com/aws/aws-cfn-resource-bridge.git
RUN cd /tmp/build/aws-cfn-resource-bridge; python setup.py install

ADD ship.d /etc/ship.d
ADD bridge.d /etc/cfn/bridge.d
ADD aws-credentials.j2 /etc/cfn/aws-credentials.j2
