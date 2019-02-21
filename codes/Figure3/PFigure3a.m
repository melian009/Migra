pkg load dataframe

X = [1 2 3 4 5 6 7 8 9 10];

%dg1
data=dataframe("dg1.csv");
red=0.1; green=0.1; blue=0.2;
dg11 = size(data(:, 'X2'));
plot(X(1,1),dg11(1,1),'k.','color',[red green blue],'Markersize',14)

hold on

%dg2
data=dataframe("dg2.csv");
red=1; green=0.1; blue=0.3;
dg12 = size(data(:, 'X2'));
plot(X(1,2),dg12(1,1),'k.','color',[red green blue],'Markersize',36)

hold on

%dg3
data=dataframe("dg3.csv");
red=0.9; green=0.2; blue=0.4;
dg13 = size(data(:, 'X2'));
plot(X(1,3),dg13(1,1)+18,'k.','color',[red green blue],'Markersize',28)

%dg4
data=dataframe("dg4.csv");
red=0.3; green=0.3; blue=0.5;
dg14 = size(data(:, 'X2'));
plot(X(1,4),dg14(1,1),'k.','color',[red green blue],'Markersize',24)

hold on

%dg5
data=dataframe("dg5.csv");
red=0.2; green=0.4; blue=0.6;
dg15 = size(data(:, 'X2'));
plot(X(1,5),dg15(1,1),'k.','color',[red green blue],'Markersize',20)

hold on

%dg6
data=dataframe("dg6.csv");
red=0.1; green=0.5; blue=0.7;
dg16 = size(data(:, 'X2'));
plot(X(1,6),dg16(1,1),'k.','color',[red green blue],'Markersize',18)

hold on

%dg7
data=dataframe("dg7.csv");
red=0.1; green=0.6; blue=0.8;
dg17 = size(data(:, 'X2'));
plot(X(1,7),dg17(1,1),'k.','color',[red green blue],'Markersize',16)

hold on

%dg8
data=dataframe("dg8.csv");
red=0.1; green=0.7; blue=0.9;
dg18 = size(data(:, 'X2'));
plot(X(1,8),dg18(1,1),'k.','color',[red green blue],'Markersize',14)

hold on

%dg9
data=dataframe("dg9.csv");
red=0.1; green=0.8; blue=1;
dg19 = size(data(:, 'X2'));
plot(X(1,9),dg19(1,1),'k.','color',[red green blue],'Markersize',12)

hold on

%dg10
data=dataframe("dg10.csv");
red=0.1; green=0.9; blue=1;
dg110 = size(data(:, 'X2'));
plot(X(1,10),dg110(1,1),'k.','color',[red green blue],'Markersize',14)

set(gca,'FontSize',20)
xlabel('\Delta G(M)','fontsize',22)
ylabel('Number of predicted values','fontsize',22)


print -color Figure3a.eps