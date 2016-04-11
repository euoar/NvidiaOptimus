INSTALL_DIR = /etc/prime-switch
.PHONY: all install uninstall

all: install

install:
	mkdir -p $(INSTALL_DIR)
	cp ./xorg.conf.template $(INSTALL_DIR)/xorg.conf.template
	cp ./gdm_display_setup.desktop $(INSTALL_DIR)/gdm_display_setup.desktop
	cp ./nvidia-optimus.sh $(INSTALL_DIR)/nvidia-optimus.sh
	cp ./prime-switch /usr/sbin/prime-switch
	chmod +x /usr/sbin/prime-switch
			

uninstall:
			
	rm -rf /usr/sbin/prime-switch

	rm -f /etc/X11/xorg.conf
	rm -f /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	rm -f /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh

	rm -rf $(INSTALL_DIR)
