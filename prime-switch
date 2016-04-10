INSTALL_DIR = /etc/prime-switch
 
# library config
nvidia64_lib_file='/etc/ld.so.conf.d/nvidia-lib64.conf'
#nvidia_lib_file='/etc/ld.so.conf.d/nvidia-lib.conf'

if [ $1 == "nvidia" ]; then
	echo "nvidia"
	printf '/usr/lib64/nvidia' > $nvidia64_lib_file
	#printf '/usr/lib/nvidia' > $nvidia64_lib_file
	
	# write needed files
	cp xorg.conf.template /etc/X11/xorg.conf 

	#for gdm
	cp $(INSTALL_DIR)/gdm_display_setup.desktop /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	cp $(INSTALL_DIR)/nvidia-optimus.sh /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	chmod +x /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	
	#for lightdm
	if [ -f  "/etc/lightdm/lightdm.conf" ]; then
		cp $(INSTALL_DIR)/nvidia-optimus.sh /etc/lightdm/nvidia-optimus.sh
		echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf
		echo "display-setup-script=/etc/lightdm/nvidia-optimus.sh" >> /etc/lightdm/lightdm.conf
	else
		echo "It looks like lightdm is not installed"
	fi 


elif [ $1 == "intel" ]; then
	echo "intel"
	printf '/usr/lib64' > $nvidia64_lib_file
	
	rm -f /etc/X11/xorg.conf
	rm -f /usr/share/gdm/greeter/autostart/gdm_display_setup.desktop
	rm -f /etc/X11/xinit/xinitrc.d/nvidia-optimus.sh
	if [ -f  "/etc/lightdm/lightdm.conf" ]; then
		rm -f /etc/lightdm/nvidia-optimus.sh
		cp $(INSTALL_DIR)/lightdm.conf.bak /etc/lightdm/lightdm.conf
	else
		echo "It looks like lightdm is not installed"
	fi 
	
fi