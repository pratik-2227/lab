vec = [3;5];
origin = [0;0];
figure(1) 
plot([origin(1) vec(1)], [origin(2) vec(2)], 'r');

G1 = [3 5; 2 7];
for X = 0:10:360
    G = [cosd(X) -sind(X); sind(X) cosd(X)];
    Gv = G*vec;
    GV = G1*Gv;
    figure(1) 
    axis equal
    subplot(2,2,1)
    hold on
    plot([origin(1) Gv(1)], [origin(2) Gv(2)], 'r')
    subplot(2,2,2)
    hold on
    plot([origin(1) GV(1)], [origin(2) GV(2)], 'b') 
end
[V,D] = eig(G1);
v1 = V(:,1) ; v2 = V(:,2);
subplot(2,2,3)
hold on
plot([origin(1) v1(1)] ,[origin(2) v1(2)])
plot([origin(1) v2(1)] ,[origin(2) v2(2)])
axis equal

GV1 = G1*v1 ; GV2 = G1*v2;
subplot(2,2,4)
hold on
plot([origin(1) GV1(1)] , [origin(2) GV1(2)],'g','LineWidth',4)
plot([origin(1) GV2(1)] , [origin(2) GV2(2)],'g','LineWidth',4)
axis equal





