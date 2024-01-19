% creating five points in matlab
x = [1,2,3,4,5];
y = [1,5,3,7,110];
plot(x,y,'o',MarkerFaceColor='b')
hold on
plot(x, y,'o')
hold on
xvec=1:0.01:8;
c=y(1);
m=(y(end)-y(1))/(x(end)-x(1));
yvec=m*xvec+c;
%plot(xvec,yvec,'b')
hold on
diff=0;
d1=intmax;
slope=0;
intercept=0;
for m=0:0.01:5
    for c=-4:0.1:4
        ysyn=m*x+c;
        diff=abs(ysyn-y);
        cost=mean(diff)*5;
        if(d1>cost)
            d1=cost;
            slope=m;
            intercept=c;
        end
    end
end 
yobs=slope*x+intercept;
plot(x,yobs,'r--')

d=intmax;
slope2=0;
intercept2=0;
for m=0:0.01:5
    for c=-4:0.1:4
        ysyn=m*x+c;
        diff=(ysyn-y).^2;
        costt=(mean(diff)*5)/(10);
        if(d>costt)
            d=costt;
            slope2=m;
            intercept2=c;
        end
    end
end 
yobs2=slope2*x+intercept2;
plot(x,yobs2,'g*-')