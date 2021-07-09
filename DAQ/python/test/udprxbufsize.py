import socket
import platform


print(f"platform.platform: {platform.platform()}")
# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
print('UDP Socket RCVBUF: {}'.format(sock.getsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF)))
