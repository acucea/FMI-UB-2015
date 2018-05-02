disp("exercitiul 2");

f = @(x) x .^ 3 - 18 .* x - 10;

x = linspace(-5,5,100);
y = f(x);
plot(x,y,'.r');

eps = 10 .^ (-3);


hold on;
xaprox_secanta_1 = MetSecantei(f,-4,-3,-3.9,-3.2,eps)
plot(xaprox_secanta_1, f(xaprox_secanta_1), '*b');


xaprox_secanta_2 = MetSecantei(f,-4,-2.5,-3.9,-3.2,eps)
plot(xaprox_secanta_2, f(xaprox_secanta_2), '*b');

xaprox_secanta_3 = MetSecantei(f,-4,-2.7,-3.9,-3.2,eps)
plot(xaprox_secanta_3, f(xaprox_secanta_3), '*b');

xaprox_poz_fals_1 = metoda_pozitiei_false(f, -4.5, -3, eps)
plot(xaprox_poz_fals_1, f(xaprox_poz_fals_1), '.g');

xaprox_poz_fals_2 = metoda_pozitiei_false(f, -1.8, 0, eps)
plot(xaprox_poz_fals_2, f(xaprox_poz_fals_2), '.g')

xaprox_poz_fals_1 = metoda_pozitiei_false(f, 1.5, 4, eps)
plot(xaprox_poz_fals_1, f(xaprox_poz_fals_1), '.g')

disp("ex 6");

A = [0 1 1; 2 1 5; 4 2 1];
b = [3 ;5 ;1];

gauss_fara_pivotare(A,b)
gauss_pivotare_totala(A,b)
gauss_pivotare_partiala(A,b)

A2 = [0 1 -2; 1 -1 1; 1 0 -1]
b2 = [4; 6; 2]

gauss_fara_pivotare(A2,b2)
gauss_pivotare_totala(A2,b2)
gauss_pivotare_partiala(A2,b2)

eps = 10 .^ -20

A_eps_mic = [eps 1; 1 1];
b_eps_mic = [1;2];

gauss_fara_pivotare(A_eps_mic,b_eps_mic)
gauss_pivotare_partiala(A_eps_mic,b_eps_mic)

eps = 10 .^ 20

A_eps_mare = [2 2.*eps; 1 1];
b_eps_mare = [2.*eps; 2];

gauss_pivotare_partiala(A_eps_mare,b_eps_mare)
gauss_pivotare_totala(A_eps_mare,b_eps_mare)

