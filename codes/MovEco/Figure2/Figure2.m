%Dermond & Melian=================================
%@Ontogenetic differential migration
%2nd half 2018 -- 1st half 2019
%=====github Migra repository=====================

Pmax =  10000;%Larger predation risk in the lake than in the stream
alpha_s = 0.8;
alpha_l = 4;

%input Data
A = dlmread('Growth.csv');
B = dlmread('SmoothedTemperatures.csv');%intraday
M1 = dlmread('MigrationStream1.csv');
M2 = dlmread('MigrationStream2.csv');

%Fitting linear regression as 1st approx. G = b*T
%low ration (<< resources)
T = A(:,1);Gl = A(:,3);
bGl = T\Gl;

% Count how many data points we have
m = length(A);
% Add a column of all ones (intercept term) to x
X = [ones(m, 1) T];
%Normal equation to fit the data
theta1 = (pinv(X'*X))*X'*Gl;

count = 0;
for dg = 5;
  migrationyes = [];
  Rls = zeros(length(B),2);
  Rss = zeros(length(B),2);
for i = 1:length(B);  
%lake
Pls = Pmax*alpha_l;
Gl = theta1(2,1)*B(i,4);
Rls(i,1) = Pls/(Gl*dg);
Rls(i,2) = i;
%Stream
Pss = Pmax*alpha_s;
Gs = theta1(2,1)*B(i,5);
Rss(i,1) = Pss/Gs;
Rss(i,2) = i;
end

migrationyes = find(Rss(:,1) > Rls(:,1));

if ~isempty(migrationyes);
   count = count + 1;
   Pm(count,2) = 1;
   Pm(count,1) = dg;
   
subplot(2,2,1)
hold on
plot(Rls(:,2),Rls(:,1),'r-')
hold on
plot(Rss(:,2),Rss(:,1),'b-')
%hold off
set(gca,'XTick',[],'YTick',[])
xlabel('Day','fontsize', 16)
ylabel('P/G','fontsize', 16)
   pause
else
   count = count + 1;
   Pm(count,2) = 0;
   Pm(count,1) = dg;
end
end%dg




