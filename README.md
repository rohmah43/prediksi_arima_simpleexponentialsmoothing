# Prediksi Jumlah Penumpang Pesawat dengan Model ARIMA dan Simple Exponential Smoothing 

Prediksi menggunakan data *time series* dari jumlah penumpang pesawat penerbangan internasional di Bandara Adisutjipto.
Membandingkan 2 metode, yaitu ARIMA dan SES (Simple Exponential Smoothing).

## 1. Model ARIMA (*Autoregresif Integrated Moving Average*)

Pada model ARIMA ini, library yang digunakan adalah **tseries** dan **forecast**. 

Sebelum melakukan prediksi, ubah data menjadi data time series dengan fungsi **ts()**. Berikut ini adalah plot datanya.

![arima1](https://user-images.githubusercontent.com/73114027/108042605-9b5bcf00-7072-11eb-8e78-4e952e59f324.PNG)

Melihat plot data aktual, trend, seasonality, dan random dari gambar berikut.

![image](https://user-images.githubusercontent.com/73114027/108042844-eece1d00-7072-11eb-91dc-54d67e3e7974.png)

Dari gambar tersebut diketahui bahwa data mengalami trend naik. Berikutnya melihat plot ACF dan PACF dari data tersebut.

![image](https://user-images.githubusercontent.com/73114027/108043216-6e5bec00-7073-11eb-9962-f4068c92c816.png)

Berdasarkan plot ACF terlihat bahwa data belum stasioner, maka perlu dilakukan differencing terhadap data. Setelah dilakukan difference 1, data menjadi stasioner yang dapat dilihat pada plot berikut.

![image](https://user-images.githubusercontent.com/73114027/108043766-14a7f180-7074-11eb-8aa8-8bd0b878c2fd.png)

![image](https://user-images.githubusercontent.com/73114027/108043907-399c6480-7074-11eb-819e-648694a48df2.png)

Uji stasioneritas data juga dapat dilakukan dengan menggunakan ADF.test.

![image](https://user-images.githubusercontent.com/73114027/108044107-6c465d00-7074-11eb-8652-37fb5b480f14.png)

Hasil p-value dari ADF.test menunjukan nilai 0.01, nilai tersebut kurang dari alpha (0.05) sehingga data tersebut stasioner.

Untuk mendapatkan model ARIMA(p,d,q) yang optimal, dilakukan trial and error untuk mencari nilai p, d, dan q. Nilai d dilihat dari difference. Karena data ini sudah stasioner dan tidak melewati proses differencing, maka nilai d adalah 0. Berdasarkan plot, dapat dilihat bahwa pada plot ACF cut off setelah lag 2 dan plot PACF cut off setelah lag 1. Sehingga model yang dapat digunakan adalah ARIMA(3,1,1), ARIMA(3,1,0) dan ARIMA(0,1,1).

![image](https://user-images.githubusercontent.com/73114027/108044645-1f16bb00-7075-11eb-8171-cf3d461b777e.png)

![image](https://user-images.githubusercontent.com/73114027/108044703-2c33aa00-7075-11eb-9fa7-ad9ea163103a.png)

![image](https://user-images.githubusercontent.com/73114027/108044735-38b80280-7075-11eb-8c74-08178772870d.png)

Dari ketiga percobaan tersebut, diketahui bahwa model ARIMA(3,1,1) merupakan model optimal karena memiliki nilai MAPE yang lebih kecil dari model lainnya, yaitu 20.98%. Berikut adalah plot data aktual dan data prediksi dari model optimal.

![image](https://user-images.githubusercontent.com/73114027/108045046-98aea900-7075-11eb-966f-d56f9d06ac65.png)

## 2. Model Simple Exponential Smoothing (SES)

![image](https://user-images.githubusercontent.com/73114027/108045829-7ec19600-7076-11eb-9dba-effcbeeab788.png)

Berdasarkan hasil tersebut, diketahui bahwa MAPE dari model tersebut adalah 22.34%. Berikut adalah plot data aktual dan prediksinya.

![image](https://user-images.githubusercontent.com/73114027/108046210-f1cb0c80-7076-11eb-8668-3aecb4448a52.png)
