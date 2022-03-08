%% Procesamiento de Se�ales - Laboratorio
%  Laboratorio 7
%  Rodrigo Garcia, 19085

Fs = 250;         % Frecuencia de muestreo                    
Ts = 1/Fs;        % Per�odo de muestreo
N = 500;          % Longitud de la se�al (n�mero de muestras). No necesariamente tiene que
                  % ser un m�ltiplo de Fs.
t = (0:(N-1))*Ts; % Vector de tiempo

%% 1) Se�ales en tiempo
% Cree una se�al, x1, que sea la suma de dos sinusoides. El primer sinusoide tiene una
% amplitud de A1 = 0.6 y una frecuencia f1 = 10 Hz. El segundo tiene una amplitud A2 = 1,
% y una frecuencia f2 = 100 Hz. Use el vector de tiempo creado arriba.
% Ayuda: A1*sin(2*pi*f1*t) devuelve un sinusoide de amplitud A1 y frecuencia f1.
% Cree tambi�n otra se�al, x2, que sea x1 m�s ruido aleatorio entre -1 y 1.
% Ayuda: use rand(size(t)).
% Cree una figura (figura 1) con dos subfiguras (una abajo de la otra). En la subfigura
% superior, grafique x1, y en la inferior, grafique x2. Grafique ambas versus el tiempo.
% Use plot para graficar. Coloque t�tulos adecuados para cada subfigura.

A1 = 0.6;
f1 = 10; %10Hz
A2 = 1;
f2 = 100; %100Hz
x1 = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);
x2 = x1 + 2*rand(1,N)-1;

figure(1);
sgtitle('Lab.7 Ejercicio No.1 gar19085');
subplot(2,1,1);
grid on;
plot(t, x1, 'g');
ylabel('Se�al x1');  
xlabel('Tiempo');

subplot(2,1,2);
grid on;
plot(t,x2);
ylabel('Se�al x2');  
xlabel('Tiempo');


%% 2) Se�ales en dominio de frecuencia
% Aplique la fft a x1 y x2. Llame a las variables resultantes X1 y X2, respectivamente.
% Nota: use s�lo un argumento de entrada para la funci�n fft (la se�al). Al usarse as�, la
%       salida ser� del mismo tama�o que la entrada. 
% En la figura 2, grafique la magnitud de X1/N en la subfigura superior, y la magnitud
% de X2/N en la subfigura inferior. Grafique ambas versus frecuencia discreta, en el
% intervalo de 0 a 2*pi rad/muestra. Use stem para graficar. Coloque t�tulos adecuados
% para cada subfigura.
% Ayuda: pueden usar el script discretefourieranalysis.m como referencia, para construir
%        el vector de frecuencia versus el cual debe graficar las magnitudes. Aunque note
%        que en dicho script se grafica vs. frecuencia normalizada. Para este ejercicio,
%        no normalice.

X1 = fft(x1);
X2 = fft(x2);
Pz1 = abs(X1)/N;
Pz2 = abs(X2)/N;
Y = linspace(0,2*pi,N);

figure(2);
sgtitle('Lab.7 Ejercicio No.2 gar19085');
subplot(2,1,1);
grid on;
stem(Y,Pz1, 'g');
ylabel('Magnitud');  
xlabel('Frecuencia');

subplot(2,1,2);
grid on;
stem(Y,Pz2);
ylabel('Magnitud');  
xlabel('Frecuencia');


% �Qu� diferencias observa entre las dos gr�ficas?
%Entre las diferencias que se pueden observar se logra ver como la gr�fica
%con valores aleatoreos se acerca un poco a los valores originales, pero a
%lo largo de la gr�fica los puntos que se obtienen estan mucho m�s
%dispersos a comparaci�n de la gr�fica original en la que esos se mantienen
%m�s constantes. 

% �Cu�les son los valores m�ximos que observa en las gr�ficas? �Qu� relaci�n tienen estos
% valores con las amplitudes de los sinuosoides?
%Los valores m�ximos en las gr�ficas para los valores en el eje X son
%6.28319 y en el eje Y el valor m�ximo es 0.5. Estos valores corresponden a
%la amplitud m�xima del sinusoide 


%% 3) Aliasing
% Cree una se�al, x3, que sea la suma de dos sinusoides, igual que antes. Pero esta vez,
% el primer sinusoide debe tener una frecuencia f3 = 260 Hz, con amplitud A3 = A1 = 0.6.
% El segundo sinusoide debe tener una frecuencia f4 = 350 Hz, con amplitud A4 = A2 = 1.
% Use el mismo vector de tiempo usado para x1 y x2.
% Luego, cree otra se�al, x4, que sea tambi�n la suma de dos sinusoides. Pero ahora, el
% primer sinusoide debe tener una frecuencia f5 = 240 Hz, con amplitud A5 = A1 = 0.6. 
% El segundo sinusoide debe tener una frecuencia f6 = 150 Hz, con amplitud A6 = A2 = 1.
% Use el mismo vector de tiempo usado para x1 y x2.
f3 = 260;
A3 = 0.6;
f4 = 350;
A4 = 1;
x3 = A3*sin(2*pi*f3*t) + A4*sin(2*pi*f4*t);
f5 = 240;
A5 = 0.6;
f6 = 150;
A6 = 1;
x4 = A5*sin(2*pi*f5*t) + A6*sin(2*pi*f6*t);

% En la figura 3, grafique x1 en la subfigura superior, x3 en la subfigura de en medio, y
% x4 en la subfigura inferior. Grafique todas versus el tiempo. 
% Use plot para graficar. Coloque t�tulos adecuados para cada subfigura.

figure(3);
sgtitle('Lab.7 Ejercicio No.3 gar19085');
subplot(3,1,1);
grid on;
plot(t, x1, 'g');
ylabel('Se�al x1');  
xlabel('Tiempo');

subplot(3,1,2);
grid on;
plot(t,x3,'r');
ylabel('Se�al x3');  
xlabel('Tiempo');

subplot(3,1,3);
grid on;
plot(t,x4);
ylabel('Se�al x4');  
xlabel('Tiempo');


% �Nota alguna diferencia entre las se�ales? Explique sus observaciones.
%Entre las se�ales x1 y x3 no se logran observar diferencias, en cambio la
%gr�fica x4 pareciera que esta desfazada y esto sucede por las frecuencias
%que utiliza.

% Aplique la fft a x3 y a x4. Nombre a las variables resultantes X3 y X4.
% En la figura 4, grafique la magnitud de X1/N en la subfigura superior, la magnitud de
% X3/N en la subfigura de en medio, y la magnitud de X4/N en la subfigura inferior.
% Grafique todas versus la frecuencia discreta, como lo hizo en el inciso 2). Use stem.
 X3 = fft(x3);
 X4 = fft(x4);
 Pz3 = abs(X3)/N;
 Pz4 = abs(X4)/N;

figure(4);
sgtitle('Lab.7 Ejercicio No.3 gar19085');
subplot(3,1,1);
grid on;
stem(Y,Pz1, 'g');
ylabel('Magnitud');  
xlabel('Frecuencia');

subplot(3,1,2);
grid on;
stem(Y,Pz3,'r');
ylabel('Magnitud');  
xlabel('Frecuencia');

subplot(3,1,3);
grid on;
stem(Y,Pz4);
ylabel('Magnitud');  
xlabel('Frecuencia');
% �C�mo se comparan las gr�ficas correspondientes a X1, X3 y X4 entre s�? Explique sus
% observaciones. 
%Las gr�ficas correspondientes son similares al obtener las magnitudes a
%pesar de que en la parte anterior x4 pareciera distinta a x3 y x1, al
%momento de obtener las magnitudes esta es igual debido al aliasing. 


%% 4) Ajuste del espectro de frecuencia usando fftshift
% Investigue la funci�n fftshift y �sela para reordenar X1 y X2 tal que el componente de
% frecuencia cero est� al centro de los arrays. Llame a las variables resultantes X1s y
% X2s, respectivamente. En la figura 5, grafique la magnitud de X1s/N en la subfigura
% superior, y la magnitud de X2s/N en la subfigura inferior. Use la funci�n stem. El eje
% horizontal de cada gr�fica debe ser de frecuencia, en Hz, NO en radianes por muestra
% (como se hizo en el inciso 2). 
% Ayuda: el vector con las frecuencias que debe usar para el eje horizontal de las figuras
%        debe estar en el intervalo [-Fs/2, Fs/2), que corresponde a las frecuencias
%        discretas en el intervalo [-pi, pi). En el help de fftshift se muestra c�mo
%        obtener el vector (busque fshift). 
X1s = fftshift(X1);
X2s = fftshift(X2);
Pz1s = abs(X1s)/N;
Pz2s = abs(X2s)/N;
fshift = (-N/2:N/2-1)*(Fs/N);

figure(5);
sgtitle('Lab.7 Ejercicio No.4 gar19085');
subplot(2,1,1);
grid on;
stem(fshift,Pz1s, 'g');
ylabel('Magnitud');  
xlabel('Frecuencia');

subplot(2,1,2);
grid on;
stem(fshift,Pz2s);
ylabel('Magnitud');  
xlabel('Frecuencia');

% �Seg�n sus gr�ficas, en qu� frecuencias aparecen los picos del espectro (los m�ximos)?
%Aparecen en frecuencias de 10 y  100Hz

% �Cu�nto son los valores m�ximos observados? �Qu� relaci�n tienen con las amplitudes A1 y
% A2 de los sinusoides?
%Los valores m�ximos son 0.3 y 0.5, la relacion existente entre las
%amplitudes A1 y A2 son los puntos medios que existen en estos sinusoides
%ya que se intersectan en el eje x


%% 5) Espectro de amplitud unilateral
% Siga las indicaciones del help de la funci�n fft para obtener y graficar el "espectro
% de amplitud unilateral" (single-sided amplitude spectrum) de x1 y x2. Use la funci�n
% stem. Las gr�ficas deben mostrarse como subfiguras en la figura 6. El eje horizontal de
% cada gr�fica debe ser de frecuencia, en Hz.
X1 = fft(x1);
X2 = fft(x2);
PZ1 = abs(X1/N);
PZ2 = abs(X2/N);
P1 = PZ1(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P2 = PZ2(1:N/2+1);
P2(2:end-1) = 2*P2(2:end-1);
f = Fs*(0:(N/2))/N;

figure(6);
sgtitle('Lab.7 Ejercicio No.5 gar19085');
subplot(2,1,1);
grid on;
stem(f,P1,'g');
ylabel('|P1(F)|');  
xlabel('Frecuencia');

subplot(2,1,2);
grid on;
stem(f,P2);
ylabel('|P2(F)|');  
xlabel('Frecuencia');


% �Cu�l es el rango de frecuencias del eje horizontal?
%El rango de frecuencias es de 0 a 125Hz.

% �Seg�n sus gr�ficas, en qu� frecuencias aparecen los picos del espectro?
%Aparecen en las frecuencias de 10 y 100Hz.

% �Cu�nto son los valores m�ximos observados? �Qu� relaci�n tienen con las amplitudes A1 y
% A2 de los sinusoides?
%Los valores m�ximos observados son 0.6 y 1, la relacion existente entre las
%amplitudes A1 y A2 son los puntos medios que existen en estos sinusoides
%ya que se intersectan en el eje x

