f = @(x) x^3 - sin(x);
f_prime = @(x) 3*x^2 - cos(x);
a = 0;
c = 1;
epsilon = 0.01;
x0 = 0.5;
x1 = 0;
x2 = 0.5;

[root1, saiso1, steps1] = ppchiadoi(f,a,c,epsilon);
fprintf('Phuong phap chia doi\n');
fprintf('Nghiem gan dung: %f, sai so thuc te: %f, so buoc lap: %d\n', root1, saiso1, steps1);

[root2, saiso2, steps2] = ppdaycung(f,a,c,epsilon);
fprintf('Phuong phap day cung\n');
fprintf('Nghiem gan dung: %f, sai so thuc te: %f, so buoc lap: %d\n', root2, saiso2, steps2);

[root3, saiso3, steps3] = ppnewton(f, f_prime, x0, epsilon);
fprintf('Phuong phap Newton\n');
fprintf('Nghiem gan dung: %f, sai so thuc te: %f, so buoc lap: %d\n', root3, saiso3, steps3);

[root4, saiso4, steps4] = ppcattuyen(f, x1, x2, epsilon);
fprintf('Phuong phap cat tuyen\n');
fprintf('Nghiem gan dung: %f, sai so thuc te: %f, so buoc lap: %d\n', root4, saiso4, steps4);
