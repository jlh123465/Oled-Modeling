.hdl 'OLEDIV.va'
.hdl 'OLEDCV.va'
.subckt oled anode cathode area=0.000002
xdc anode cathode empyreanolediv area=area
xac anode cathode empyreanoledcv area=area
.ends