build:
	docker build -t srzzumix/oneapi-cxx .

run:
	docker run -it --rm srzzumix/oneapi-cxx bash 

version:
	docker run -it --rm srzzumix/oneapi-cxx icx --version 
