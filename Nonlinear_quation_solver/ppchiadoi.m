function [root, saiso, steps] = ppchiadoi(f, a, c, epsilon)
  if (f(a)*f(c) > 0)
    error('Khong co nghiem trong khoang nay');
  end
  steps = 0;
  b = (a+c)/2; % Khởi tạo b
  while abs(c-a) >= epsilon
    b = (a+c)/2; % Cập nhật giá trị của b
    if(f(b)==0)
        break;
    elseif(f(a)*f(b) < 0)
        c = b;
    else
        a = b;
    end
    steps = steps + 1;
  end
  root = (a+c)/2;
  saiso = abs(c-a);
end



