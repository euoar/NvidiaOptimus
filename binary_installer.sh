if [ $1 == "install" ]; then
	/home/eu/preinstalarNvidiaRun.sh

	#/home/eu/Descargas/NVIDIA-Linux-x86_64-361.42.run --x-library-path=lib64/nvidia --x-module-path=xorg/modules  --opengl-libdir=lib64/nvidia --utility-libdir=lib64/nvidia
	#/home/eu/Descargas/NVIDIA-Linux-x86_64-361.42.run --x-library-path=lib64/nvidia --opengl-libdir=lib64/nvidia --utility-libdir=lib64/nvidia

#/home/eu/Descargas/NVIDIA-Linux-x86_64-361.42.run --accept-license --silent --no-x-check --no-nouveau-check --no-recursion --opengl-libdir=lib64/nvidia --opengl-prefix=/usr --x-library-path=lib64/nvidia --x-prefix=/usr --x-module-path=/usr/lib64/nvidia/xorg/modules --compat32-libdir=lib/nvidia --compat32-prefix=/usr 

/home/eu/Descargas/NVIDIA-Linux-x86_64-361.42.run --accept-license --silent --no-x-check --no-nouveau-check --no-recursion --opengl-libdir=lib64/nvidia --opengl-prefix=/usr --x-library-path=lib64/nvidia --x-prefix=/usr --compat32-libdir=lib/nvidia --compat32-prefix=/usr 

#/home/eu/Descargas/NVIDIA-Linux-x86_64-361.42.run --accept-license --silent --no-x-check --no-nouveau-check --opengl-libdir=lib64/nvidia --opengl-prefix=/usr --x-library-path=lib64/nvidia --x-prefix=/usr --x-module-path=/usr/lib64/nvidia/xorg/modules --compat32-libdir=lib/nvidia --compat32-prefix=/usr 

#/home/eu/Descargas/NVIDIA-Linux-x86_64-361.42.run --accept-license --silent --no-x-check --no-nouveau-check --no-recursion --opengl-libdir=lib64/nvidia --opengl-prefix=/usr --x-library-path=lib64/nvidia --x-prefix=/usr --x-module-path=/usr/lib64/nvidia/xorg/modules --compat32-libdir=lib/nvidia --compat32-prefix=/usr 


#/home/eu/Descargas/NVIDIA-Linux-x86_64-364.15.run --accept-license --silent --no-x-check --no-nouveau-check --no-recursion --opengl-libdir=lib64/nvidia --opengl-prefix=/usr --x-library-path=lib64/nvidia --x-prefix=/usr --x-module-path=/usr/lib64/nvidia/xorg/modules --compat32-libdir=lib/nvidia --compat32-prefix=/usr 
#	/home/eu/Descargas/NVIDIA-Linux-x86_64-361.42.run --opengl-libdir=lib64/nvidia
elif [ $1 == "remove" ]; then
	nvidia-installer --uninstall
	dnf reinstall -y xorg-\* mesa\*
fi
