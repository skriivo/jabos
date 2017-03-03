netsh advfirewall firewall add rule name="Check_MK" enable="yes" dir="in" remoteip="<check_mk_server>/32" localport="6556" remoteport="any" action="allow" protocol=tcp
