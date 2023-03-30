## Activity1:
* To make the tools diractory you can type the file sizes you want inside **files_sizes.txt** 
	![files_sizes](./screenshots/20230328155815.png)
* then run `./create_sized_files.sh` 
	![creating_files](./screenshots/20230329183442.png)
* After that you can start benchmark AES and 3DES:
	* benchmarking AES: 
		- using the command `./aes_test.sh {filename} tools/`
			![](./screenshots/20230329183831.png)
		- the output file is going to be: **filename.csv**
			in this example is **AES.csv** ![](./screenshots/20230329184055.png)
		- than we can make a graph out of it:
			![](./screenshots/20230330065438.png)
		- as we can see **cbc** is faster
	* benchmarking 3DES:
		- using the command `3des_test.sh {filename} tools/`
			![](./screenshots/20230329185032.png)
		- and the output file is: **filename.csv** 
			in this example is **3DES.csv**
			![](./screenshots/20230329190011.png)
		- than we can make a graph out of that file too:
			![](./screenshots/20230330065610.png)
		- we can have the same conclustion **cbc** is faster than **ecb** 

## Activity2:

* you can put the names and passwords or the users on a txt file: 
	![](./screenshots/20230330070155.png)
* and put **name**,**password**  
	![](./screenshots/20230330071354.png)
	- for example username: **Abdelhak** and password: **Hunter** 
* then you can create the users with there passwords and the private and the public keys with the command: 
	- `sudo ./create_users.sh {filename}` in this case the filename is users.txt: `sudo ./create_users.sh users.txt` 
	![](./screenshots/20230330071540.png)
* and when we run `ll` on home diractory
	![](./screenshots/20230330071719.png)
	- we can see that the **PUBKEYS** don't have write permissions
	![](./screenshots/20230330072008.png)
	
