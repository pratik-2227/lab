x_component = 3;
y_component = 4;
start_point = [0, 0];
end_point = [x_component, y_component];

v = [x_component, y_component];
%plotting vector
plot([start_point(1),v(1)], [start_point(2), v(2)],'r');
hold on;

%multiplying vector with G matrix
G = [2 -1; 0 1];

result = G*v';
%plotting result 
plot([start_point(1),result(1)], [start_point(2), result(2)],'g');
hold on;

% calculate svd
[U,S,V] = svd(G);

Vt = V'*v';
plot([start_point(1),Vt(1)], [start_point(2), Vt(2)],'b');
St = S*Vt;
plot([start_point(1),St(1)], [start_point(2), St(2)]);
Ut = U*St;
plot([start_point(1),Ut(1)], [start_point(2), Ut(2)],'-o');



