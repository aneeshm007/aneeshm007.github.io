%Program 6.4 Plotting program for one-body problem 
% Inputs: time interval inter, initial conditions
% ic = [x0 vx0 y0 vy0], x position, x velocity, y pos, y vel,
% number of steps n, steps per point plotted p
% Calls a one-step method such as trapstep.m
% Example usage: orbit2016([0 100],[0 1 2 0],10000,5)
function z=orbit11(inter,ic,n,p,m1,m2,m3)
m1=m1;
m2=m2;
m3=m3;
h=(inter(2)-inter(1))/n;        % plot n points 
x10=ic(1);vx10=ic(2);y10=ic(3);vy10=ic(4);% grab initial conds
x20=ic(5);vx20=ic(6);y20=ic(7);vy20=ic(8);
x30=ic(9);vx30=ic(10);y30=ic(11);vy30=ic(12);

y(1,:)=[x10 vx10 y10 vy10 x20 vx20 y20 vy20 x30 vx30 y30 vy30];t(1)=inter(1);    % build y vector
set(gca,'XLim',[-5 5],'YLim',[-5 5],...
    'XTick',[-5 0 5],'YTick',[-5 0 5]);
%sun=animatedline('color','y','Marker','.','markersize',50);
%addpoints(sun,0,0)
head=animatedline('color','r','Marker','.','markersize',35);
tail=animatedline('color','b','LineStyle','-');

head2=animatedline('color','g','Marker','.','markersize',35);
tail2=animatedline('color','b','LineStyle','-');

head3=animatedline('color','m','Marker','.','markersize',35);
tail3=animatedline('color','b','LineStyle','-');
%[px,py]=ginput(1);                % include these three lines
%[px1,py1]=ginput(1);              % to enable mouse support
%y(1,:)=[px px1-px py py1-py];     % 2 clicks set direction
v=VideoWriter('filename', 'MPEG-4');open(v)
for k=1:n/p
  for i=1:p
    t(i+1)=t(i)+h;
    y(i+1,:)=trapstep(t(i),y(i,:),h,m1,m2,m3);
   
  end
  y(1,:)=y(p+1,:);t(1)=t(p+1);

  clearpoints(head);
  addpoints(head,y(1,1),y(1,3))
  addpoints(tail,y(1,1),y(1,3))
  
  clearpoints(head2);
  addpoints(head2,y(1,9),y(1,11))
  addpoints(tail2,y(1,9),y(1,11))
  
  clearpoints(head3);
  addpoints(head3,y(1,5),y(1,7))
  addpoints(tail3,y(1,5),y(1,7))
  drawnow;
  
  frame=getframe;
  writeVideo(v,frame);
end
close(v)


function y=trapstep(t,x,h,m1,m2,m3)
m1=m1;
m2=m2;
m3=m3;
z1=ydot(t,m1,m2,m3,x);
g=x+h*z1;
z2=ydot(t+h,m1,m2,m3,g);
y=x+h*(z1+z2)/2;

function z = ydot(t,m1,m2,m3,x)
m2=m2;
m1=m1;
m3=m3;
g=1;
mg=[m1*g m2*g m3*g];

px1=x(1);
px2=x(5);
px3=x(9);

vx1=x(2);
vx2=x(6);
vx3=x(10);

py1=x(3);
py2=x(7);
py3=x(11);

vy1=x(4);
vy2=x(8);
vy3=x(12);


dist1=sqrt((px2-px1)^2+(py2-py1)^2);
dist2=sqrt((px3-px1)^2+(py3-py1)^2);
dist3=sqrt((px2-px3)^2+(py2-py3)^2);

z=zeros(1,12);
z(1)=vx1;
z(2)=(mg(2)*(px2-px1))/(dist1^3) + (mg(3)*(px3-px1)/dist2^3);
z(3)=vy1;
z(4)=(mg(2)*(py2-py1))/(dist1^3) + (mg(3)*(py3-py1)/dist2^3);

z(5)=vx2;
z(6)=(mg(1)*(px1-px2))/(dist1^3) + (mg(3)*(px3-px2)/dist3^3);
z(7)=vy2;
z(8)=(mg(1)*(py1-py2))/(dist1^3) + (mg(3)*(py3-py2)/dist3^3);

z(9)=vx3;
z(10)=(mg(1)*(px1-px3))/(dist2^3) + (mg(2)*(px2-px3)/dist3^3);
z(11)=vy3;
z(12)=(mg(1)*(py1-py3))/(dist2^3) + (mg(2)*(py2-py3)/dist3^3);


