%Philip & Melian=================================
%@Eawag-KB Ontogenetic differential migration
%2nd half 2018--1st 2019
%=====github Migration repository================

%Empirical Data=============================================
A = dlmread('Growth.csv');
B = dlmread('SmoothedTemperatures.csv');%intraday
M1 = dlmread('MigrationStream1.csv');
M2 = dlmread('MigrationStream2.csv');
%===========================================================

%=======Fitting linear regression as 1st approx. G = b*T====
%low ration (<< resources)
T = A(:,1);Gl = A(:,3);
bGl = T\Gl;

% Count how many data points we have
m = length(A);
% Add a column of all ones (intercept term) to x
X = [ones(m, 1) T];
%Normal equation to fit the data
theta1 = (pinv(X'*X))*X'*Gl;
%============================================================


countp = 0;%For plotting each dg simulation

for t = 1:10000;%Number replicates
  
  %large inds
  alpha_s = unifrnd(0.01,3);
  alpha_l = unifrnd(1,5);
  
  %small inds
  alpha_ss = unifrnd(0.1,1);
  alpha_ls = unifrnd(1,5);

%Test to guarantee migration day ok=====================
%alpha_s = 0.8;
%alpha_l = 4;

%small 
%alpha_ss = 0.5;
%alpha_ls = 3;
%=======================================================

%Initial carrying capacity and differential growth====
Pmax =  10000;
dg = 4;
%=====================================================

  migrationyes = [];
  Rls = zeros(length(B),2);
  Rss = zeros(length(B),2);
  
for i = 1:length(B);  
%Lake--large inds-----------
Plake = Pmax*alpha_l;
Glake = theta1(2,1)*B(i,4);
Rls(i,1) = Plake/(dg*Glake);
Rls(i,2) = i;
%Stream--large inds--------
Pss = Pmax*alpha_s;
Gs = theta1(2,1)*B(i,5);
Rss(i,1) = Pss/Gs;
Rss(i,2) = i;
end

migrationyes = find(Rss(:,1) >= Rls(:,1));
if ~isempty(migrationyes);
%=====================Check crossing points large inds ==============
%subplot(2,2,1)
%hold off
%plot(Rls(:,2),Rls(:,1),'r-')
%hold on
%plot(Rss(:,2),Rss(:,1),'b-')
%hold off
%set(gca,'XTick',[],'YTick',[])
%xlabel('Day','fontsize', 16)
%ylabel('P/G','fontsize', 16)
%====================================================================

 migrationyes_small = [];
  Rls = zeros(length(B),2);
  Rss = zeros(length(B),2);
for j = 1:length(B);  
%lake--small inds
Plss = Pmax*alpha_ls;
Gls = theta1(2,1)*B(j,4);
Rls(j,1) = Plss/(dg*Gls);
Rls(j,2) = j;
%Stream--small inds
Psss = Pmax*alpha_ss;
Gss = theta1(2,1)*B(j,5);
Rss(j,1) = Psss/Gss;% + theta1(1,1));
Rss(j,2) = j;
end

migrationyes_small = find(Rss(:,1) >= Rls(:,1));

if ~isempty(migrationyes_small);
%check crossing points small inds =====================
%subplot(2,2,2)
%hold off
%plot(Rls(:,2),Rls(:,1),'r--')
%hold on
%plot(Rss(:,2),Rss(:,1),'b--')
%hold off
%set(gca,'XTick',[],'YTick',[])
%xlabel('Day','fontsize', 16)
%ylabel('P/G','fontsize', 16)
%=======================================================

%Compare large and small
     if migrationyes(1,1) < migrationyes_small(1,1);
       countp = countp + 1;
       
%===============test===========
migrationyes(1,1)
migrationyes_small(1,1)

pause
%=============================

Glake = theta1(2,1)*B(migrationyes(1,1),4);
Gs = theta1(2,1)*B(migrationyes(1,1),5);
A4(countp,1) = Pss/Gs;
A4(countp,2) = Plake/(dg*Glake);
     end% migra...
end%migra small...
end%migrationyes...

end%t


