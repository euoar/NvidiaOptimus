.PHONY: all install uninstall

all: install

install:
	cp xorg.conf.template /etc/X11/xorg.conf
	
	#for gdm
	cp gdm_display_setup.desktop /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	cp nvidia-optimus.sh /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	chmod +x /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	
	#for lightdm	
	cp nvidia-optimus.sh /etc/lightdm/nvidia-optimus.sh
	cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bak
	echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf
	echo "display-setup-script=/etc/lightdm/nvidia-optimus.sh" >> /etc/lightdm/lightdm.conf
	 

uninstall:
	rm -f /etc/X11/xorg.conf
	rm -f /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	rm -f /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	rm -f /etc/lightdm/nvidia-optimus.sh
	cp /etc/lightdm/lightdm.conf.bak /etc/lightdm/lightdm.conf
	rm /etc/lightdm/lightdm.conf.bak
