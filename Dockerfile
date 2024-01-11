FROM kalilinux/kali-rolling:latest
RUN apt-get update && \
    apt-get install -y git python3-pip figlet sudo && \
    apt-get install -y boxes php curl xdotool wget

WORKDIR /root/hacking_tools
COPY requirements.txt ./
RUN pip3 install --no-cache-dir boxes flask lolcat requests -r requirements.txt
COPY . .
RUN true && echo "/root/hacking_tools/" > /home/hacking_toolspath.txt;
EXPOSE 1-65535
ENTRYPOINT ["python3", "/root/hacking_tools/hacking_tools.py"]