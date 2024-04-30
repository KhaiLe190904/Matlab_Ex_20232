f = @(x) x^3 + x -1;
g = @(x) (1-x)^(1/3);
x0 = 0.5
epsilon = 0.0001
[root1, steps1] = phuongphaplap(g, x0, epsilon)
printf("Nghiem: %f, So buoc lap: %d", root1, steps1);
