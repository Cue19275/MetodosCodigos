%% Procesamiento de Señales - Laboratorio
%  Laboratorio 7
%  Rodrigo Garcia, 19085

Fs = 250;         % Frecuencia de muestreo                    
Ts = 1/Fs;        % Período de muestreo
N = 500;          % Longitud de la señal (número de muestras). No necesariamente tiene que
                  % ser un múltiplo de Fs.
t = (0:(N-1))*Ts; % Vector de tiempo

%% 1) Señales en tiempo
% Cree una señal, x1, que sea la suma de dos sinusoides. El primer sinusoide tiene una
% amplitud de A1 = 0.6 y una frecuencia f1 = 10 Hz. El segundo tiene una amplitud A2 = 1,
% y una frecuencia f2 = 100 Hz. Use el vector de tiempo creado arriba.
% Ayuda: A1*sin(2*pi*f1*t) devuelve un sinusoide de amplitud A1 y frecuencia f1.
% Cree también otra señal, x2, que sea x1 más ruido aleatorio entre -1 y 1.
% Ayuda: use rand(size(t)).
% Cree una figura (figura 1) con dos subfiguras (una abajo de la otra). En la subfigura
% superior, grafique x1, y en la inferior, grafique x2. Grafique ambas versus el tiempo.
% Use plot para graficar. Coloque títulos adecuados para cada subfigura.

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
ylabel('Señal x1');  
xlabel('Tiempo');

subplot(2,1,2);
grid on;
plot(t,x2);
ylabel('Señal x2');  
xlabel('Tiempo');


%% 2) Señales en dominio de frecuencia
% Aplique la fft a x1 y x2. Llame a las variables resultantes X1 y X2, respectivamente.
% Nota: use sólo un argumento de entrada para la función fft (la señal). Al usarse así, la
%       salida será del mismo tamaño que la entrada. 
% En la figura 2, grafique la magnitud de X1/N en la subfigura superior, y la magnitud
% de X2/N en la subfigura inferior. Grafique ambas versus frecuencia discreta, en el
% intervalo de 0 a 2*pi rad/muestra. Use stem para graficar. Coloque títulos adecuados
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


% ¿Qué diferencias observa entre las dos gráficas?
%Entre las diferencias que se pueden observar se logra ver como la gráfica
%con valores aleatoreos se acerca un poco a los valores originales, pero a
%lo largo de la gráfica los puntos que se obtienen estan mucho más
%dispersos a comparación de la gráfica original en la que esos se mantienen
%más constantes. 

% ¿Cuáles son los valores máximos que observa en las gráficas? ¿Qué relación tienen estos
% valores con las amplitudes de los sinuosoides?
%Los valores máximos en las gráficas para los valores en el eje X son
%6.28319 y en el eje Y el valor máximo es 0.5. Estos valores corresponden a
%la amplitud máxima del sinusoide 


%% 3) Aliasing
% Cree una señal, x3, que sea la suma de dos sinusoides, igual que antes. Pero esta vez,
% el primer sinusoide debe tener una frecuencia f3 = 260 Hz, con amplitud A3 = A1 = 0.6.
% El segundo sinusoide debe tener una frecuencia f4 = 350 Hz, con amplitud A4 = A2 = 1.
% Use el mismo vector de tiempo usado para x1 y x2.
% Luego, cree otra señal, x4, que sea también la suma de dos sinusoides. Pero ahora, el
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
% Use plot para graficar. Coloque títulos adecuados para cada subfigura.

figure(3);
sgtitle('Lab.7 Ejercicio No.3 gar19085');
subplot(3,1,1);
grid on;
plot(t, x1, 'g');
ylabel('Señal x1');  
xlabel('Tiempo');

subplot(3,1,2);
grid on;
plot(t,x3,'r');
ylabel('Señal x3');  
xlabel('Tiempo');

subplot(3,1,3);
grid on;
plot(t,x4);
ylabel('Señal x4');  
xlabel('Tiempo');


% ¿Nota alguna diferencia entre las señales? Explique sus observaciones.
%Entre las señales x1 y x3 no se logran observar diferencias, en cambio la
%gráfica x4 pareciera que esta desfazada y esto sucede por las frecuencias
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
% ¿Cómo se comparan las gráficas correspondientes a X1, X3 y X4 entre sí? Explique sus
% observaciones. 
%Las gráficas correspondientes son similares al obtener las magnitudes a
%pesar de que en la parte anterior x4 pareciera distinta a x3 y x1, al
%momento de obtener las magnitudes esta es igual debido al aliasing. 


%% 4) Ajuste del espectro de frecuencia usando fftshift
% Investigue la función fftshift y úsela para reordenar X1 y X2 tal que el componente de
% frecuencia cero esté al centro de los arrays. Llame a las variables resultantes X1s y
% X2s, respectivamente. En la figura 5, grafique la magnitud de X1s/N en la subfigura
% superior, y la magnitud de X2s/N en la subfigura inferior. Use la función stem. El eje
% horizontal de cada gráfica debe ser de frecuencia, en Hz, NO en radianes por muestra
% (como se hizo en el inciso 2). 
% Ayuda: el vector con las frecuencias que debe usar para el eje horizontal de las figuras
%        debe estar en el intervalo [-Fs/2, Fs/2), que corresponde a las frecuencias
%        discretas en el intervalo [-pi, pi). En el help de fftshift se muestra cómo
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

% ¿Según sus gráficas, en qué frecuencias aparecen los picos del espectro (los máximos)?
%Aparecen en frecuencias de 10 y  100Hz

% ¿Cuánto son los valores máximos observados? ¿Qué relación tienen con las amplitudes A1 y
% A2 de los sinusoides?
%Los valores máximos son 0.3 y 0.5, la relacion existente entre las
%amplitudes A1 y A2 son los puntos medios que existen en estos sinusoides
%ya que se intersectan en el eje x


%% 5) Espectro de amplitud unilateral
% Siga las indicaciones del help de la función fft para obtener y graficar el "espectro
% de amplitud unilateral" (single-sided amplitude spectrum) de x1 y x2. Use la función
% stem. Las gráficas deben mostrarse como subfiguras en la figura 6. El eje horizontal de
% cada gráfica debe ser de frecuencia, en Hz.
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


% ¿Cuál es el rango de frecuencias del eje horizontal?
%El rango de frecuencias es de 0 a 125Hz.

% ¿Según sus gráficas, en qué frecuencias aparecen los picos del espectro?
%Aparecen en las frecuencias de 10 y 100Hz.

% ¿Cuánto son los valores máximos observados? ¿Qué relación tienen con las amplitudes A1 y
% A2 de los sinusoides?
%Los valores máximos observados son 0.6 y 1, la relacion existente entre las
%amplitudes A1 y A2 son los puntos medios que existen en estos sinusoides
%ya que se intersectan en el eje x

