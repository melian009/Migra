pkg load dataframe

%dg1
data=dataframe("dg1.csv");
red=0.1; green=0.1; blue=0.2;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',14)

hold on

%dg2
data=dataframe("dg2.csv");
red=1; green=0.1; blue=0.3;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',34)

hold on

%dg3
data=dataframe("dg3.csv");
red=0.9; green=0.2; blue=0.4;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',30)

%dg4
data=dataframe("dg4.csv");
red=0.3; green=0.3; blue=0.5;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',18)

hold on

%dg5
data=dataframe("dg5.csv");
red=0.2; green=0.4; blue=0.6;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',16)

hold on

%dg6
data=dataframe("dg6.csv");
red=0.1; green=0.5; blue=0.7;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',14)

hold on

%dg7
data=dataframe("dg7.csv");
red=0.1; green=0.6; blue=0.8;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',13)

hold on

%dg8
data=dataframe("dg8.csv");
red=0.1; green=0.7; blue=0.9;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',12)

hold on

%dg9
data=dataframe("dg9.csv");
red=0.1; green=0.8; blue=1;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',11)

hold on

%dg10
data=dataframe("dg10.csv");
red=0.1; green=0.9; blue=1;
plot(data(:, 'X1'),data(:, 'X2'),'k.','color',[red green blue],'Markersize',10)


set(gca,'FontSize',20)
xlabel('P_S(M)/G_S(M)','fontsize',22)
ylabel('P_L(M)/ \Delta G(M) G_L(M)','fontsize',22)

hold on

x = [0 0.2 0.6 1 1.4];
y = [0 0.2 0.6 1 1.4];
plot(x,y)

print -color Figure3.eps