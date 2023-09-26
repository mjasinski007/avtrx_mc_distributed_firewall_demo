# Allow Ping
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow







# Disable Firewall
#Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

# ## NTTCP Firewall Settings
# netsh advfirewall firewall add rule program=C:\tools\ntttcp.exe name="__NTTTCP_IN" protocol=Any dir=in action=allow enable=yes profile=any
# netsh advfirewall firewall add rule program=C:\tools\ntttcp.exe name="__NTTTCP_OUT" protocol=Any dir=OUT action=allow enable=yes profile=any


# ## Latte Firewall Settings
# netsh advfirewall firewall add rule program=C:\tools\latte.exe name="__LATTE_IN" protocol=any dir=in action=allow enable=yes profile=ANY
# netsh advfirewall firewall add rule program=C:\tools\latte.exe name="__LATTE_OUT" protocol=any dir=out action=allow enable=yes profile=ANY






# NTTCP Firewall Settings
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\ntttcp.exe name="__NTTTCP_IN" protocol=Any dir=in action=allow enable=yes profile=any
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\ntttcp.exe name="__NTTTCP_OUT" protocol=Any dir=OUT action=allow enable=yes profile=any

#Allow Ping
#netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow

# Latte Firewall Settings
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\latte.exe name="__Latte_IN" protocol=any dir=in action=allow enable=yes profile=ANY
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\latte.exe name="__Latte_OUT" protocol=any dir=out action=allow enable=yes profile=ANY


