function n = get_normal(x, y)
%disp('get_normal')
    len = length(x);
    x_normal = [y(2:len);y(1)] - y;
    y_normal = x - [x(2:len);x(1)]; 
    n = [x_normal y_normal zeros(len, 1)];
    n = n./sum(n.^2, 2).^0.5;
end
