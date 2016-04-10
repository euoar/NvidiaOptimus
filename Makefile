INSTALL_DIR = /etc/prime-switch
.PHONY: all install uninstall

all: install

install:
	mkdir -p $(INSTALL_DIR)
	cp xorg.conf.template /etc/X11/xorg.conf
	cp gdm_display_setup.desktop $(INSTALL_DIR)/gdm_display_setup.desktop
	cp nvidia-optimus.sh $(INSTALL_DIR)/nvidia-optimus.sh
	cp prime-switch /usr/sbin/prime-switch
			
	#for gdm
	cp gdm_display_setup.desktop /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	cp nvidia-optimus.sh /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	chmod +x /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	
	#for lightdm
	cp /etc/lightdm/lightdm.conf $(INSTALL_DIR)/lightdm.conf.bak

uninstall:
			
	rm -rf /usr/sbin/prime-switch

	rm -f /etc/X11/xorg.conf
	rm -f /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	rm -f /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	
	# restore lightdm default setup
	rm -f /etc/lightdm/nvidia-optimus.sh
	cp $(INSTALL_DIR)/lightdm.conf.bak /etc/lightdm/lightdm.conf
	rm /etc/lightdm/lightdm.conf.bak

	rm -rf $(INSTALL_DIR)