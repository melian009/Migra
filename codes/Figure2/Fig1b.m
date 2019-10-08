Pmax =  10000;
%Stream small 
alpha_s = 0.5;%0.8
%beta_small = 0.5;
%Lake small
alpha_l = 3;%4
beta_lsmall = 0.5;

%Data
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
dg = 2;
for beta_small = 0.1:0.01:1;
  migrationyes = [];
  Rls = zeros(length(B),2);
  Rss = zeros(length(B),2);
for i = 1:length(B);  
%lake
%theta2 = theta1(2,1)*dg;%5 emp
Pls = Pmax*alpha_l*beta_lsmall;
%Gl = theta1(2,1)*dg*B(i,4);%OPT 1
Gl = theta1(2,1)*B(i,4);%OPT 2

Rls(i,1) = Pls/(Gl*dg);% + theta1(1,1));
Rls(i,2) = i;
%Stream
Pss = Pmax*alpha_s*beta_small;
Gs = theta1(2,1)*B(i,5);
Rss(i,1) = Pss/Gs;% + theta1(1,1));
Rss(i,2) = i;

%Analytical
%if (Pls*Gs)/(Pss*Gl) < dg%OPT1 ok
%if (Pls/Pss) < dg*(Gl/Gs)%OPT2
   
%A3 = dg%OPT1
%B3 = (Pls*Gs)/(Pss*Gl)%OPT1

%A3 = dg*(Gl/Gs)%OPT2
%B3 = (Pls/Pss)%OPT2
%end

end
%subplot(2,2,1)
%plot(Rls(:,2),Rls(:,1),'r--')
%hold on
%plot(Rss(:,2),Rss(:,1),'b--')
%set(gca,'XTick',[],'YTick',[])
%xlabel('Day','fontsize', 16)
%ylabel('P/G','fontsize', 16)
%hold off
%dg
migrationyes = find(Rss(:,1) > Rls(:,1));
%pause
if ~isempty(migrationyes);
%if Rss > Rls
  count = count + 1;
   Pm(count,2) = (migrationyes(1,1))/30;
   Pm(count,1) = count;
   
 %  dg
 %  Pls*Gs 
 %  Pss*Gl
   %pause
%else
%   count = count + 1;
%   Pm(count,2) = 0;
%   Pm(count,1) = dg;
end
%subplot(2,2,2)
%pause


end%dg
plot(Pm(:,1),Pm(:,2),'ro')
xlabel('Gamma','fontsize', 16)
ylabel('Local Richness','fontsize', 16)
%analytical
%for dg = 1:10;

%end



