import upnpy
import socket

upnp = upnpy.UPnP()
devices = upnp.discover()
device = upnp.get_igd()

wan_conn_index = -1
for index in range(len(device.get_services())):
    if device.get_services()[index].id.find('Conn') != -1:
        wan_conn_index = index

if wan_conn_index == -1:
    raise RuntimeError('Could not find WAN Connection.')

service = device.get_services()[wan_conn_index]

local_ip_address = socket.gethostbyname(socket.gethostname())

service.AddPortMapping(NewRemoteHost='', NewExternalPort=6008, NewProtocol='UDP', NewInternalPort=6008, NewInternalClient=local_ip_address, NewEnabled=1, NewPortMappingDescription='DWA', NewLeaseDuration=0)

print(f'UDP port 6008 opened for {local_ip_address}')
