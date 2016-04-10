INSTALL_DIR = /etc/prime-switch
.PHONY: all install uninstall

all: install

install:
	mkdir -p $(INSTALL_DIR)
	cp xorg.conf.template /etc/X11/xorg.conf
	cp gdm_display_setup.desktop $(INSTALL_DIR)/gdm_display_setup.desktop
	cp nvidia-optimus.sh $(INSTALL_DIR)/nvidia-optimus.sh
	cp prime-switch.sh /usr/sbin/prime-switch.sh
			
	#for gdm
	cp gdm_display_setup.desktop /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	cp nvidia-optimus.sh /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	chmod +x /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	
	#for lightdm
	if [ -f  "/etc/lightdm/lightdm.conf" ]; then
		cp /etc/lightdm/lightdm.conf $(INSTALL_DIR)/lightdm.conf.bak
		cp nvidia-optimus.sh /etc/lightdm/nvidia-optimus.sh
		echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf
		echo "display-setup-script=/etc/lightdm/nvidia-optimus.sh" >> /etc/lightdm/lightdm.conf
	else
		echo "It looks like lightdm is not installed"
	fi 

uninstall:
			
	rm -rf /usr/sbin/prime-switch.sh

	rm -f /etc/X11/xorg.conf
	rm -f /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	rm -f /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	
	# restore lightdm default setup
	if [ -f  "/etc/lightdm/lightdm.conf" ]; then
		rm -f /etc/lightdm/nvidia-optimus.sh
		cp $(INSTALL_DIR)/lightdm.conf.bak /etc/lightdm/lightdm.conf
		rm /etc/lightdm/lightdm.conf.bak
	else
		echo "It looks like lightdm is not installed"
	fi 

	rm -rf $(INSTALL_DIR)