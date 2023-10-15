syms Re Rbi Rs Rp Cd Cg V1 Vo Vbi w V I a b c d e;
a=1/(1+exp(-Vbi+V));
b=1/(1+exp(Vbi-V));
c=1/(1+exp(V-Vo));
d=b*c;
e=1/(1+exp(Vo-V));
V1=V-I*Re;
h=-a/w*Cg-d*Rbi*V*(w*Cd*Rbi*V1-w*Cd*Rbi*Vbi+V1*Rbi*w*Cg)/((V1-Vbi)^2+(V1*w*Cd*Rbi-Vbi*w*Cd*Rbi+V1*Rbi*w*Cg)^2)-e*Rbi*Rs*Rp*V*(w*Cd*V1-w*Cd*Vbi+V1*w*Cg)*(V1*Rs*Rp-Vbi*Rs*Rp+V1*Rbi*Rp-Vo*Rbi*Rp+V1*Rbi*Rs)^2;
Ire=diff(h,Cd)