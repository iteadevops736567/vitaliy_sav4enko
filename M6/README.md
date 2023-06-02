1. створити декілька віртуальних серверів в EC2;

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/1.jpg)

2. створити security group де буде назовні доступний порт 22, 80, 443, 3000;

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/2.jpg)

3. attach створену security group на створені сервери;

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/3.1.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/3.2.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/3.3.jpg)

4. створити 2 volumes і аттачнути по одному на кожен з серверів;
5. зайти на сервери і додати якісь файли на кожен з них (різні файли);

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/4.1.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/4.2.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/4.3.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/4.4.jpg)

6. створити image кожного з volume, створити з цих image нові volume і attach їх на сервери (тобто щоб у вас по суті було два однакових сервери з двома volumes);

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/6.1.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/6.2.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/6.3.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/6.4.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/6.5.jpg)


7. створюєте elastic ip і асайните його на один з серверів.

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/7.1.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/7.2.jpg)

8. створити AMI одного з серверів, видалити всю інфраструктуру і відновити сервер з його резервної копії з усіма його volumes;

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/8.1.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/8.2.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/8.3.jpg)

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/8.4.jpg)

9. заасайнити elastic ip створений на етапі 7 на новий сервер.

![.](https://github.com/iteadevops736567/vitaliy_sav4enko/blob/master/M6/9.jpg)
