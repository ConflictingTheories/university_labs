function graph_gmm(X,mi,sig,c,coefs,ft)
% 
% graph_gmm(X,mi,sig,c,<coefs,ft>)
% 
% plots the distribution of coefficients
  
  
DEBUG=0;
PRINT=0;
[L,T]=size(X);

if (nargin<5), coefs=1:L; end
if (nargin<6), ft=0; end

LL=length(coefs);

li=fix(sqrt(LL));
co=ceil(LL/li);

figure(33);
clf;

% loop through coefs
for ll=1:LL 
    % select coef
l=coefs(ll);
    % minimum value in sig data
  xm=min(X(l,:));
  % max value in sig data
xM=max(X(l,:));
% x = 0:(xM-xm)./100:(xM+(xM-xm)) (101 steps)
x=(-ft*(xM-xm)+xm):((ft+1)*(xM-xm)./100):(xM+ft*(xM-xm));


subplot(li,co,ll);
% plot hist
histn(X(l,:),300);
if ll == 1
    title('X - Data');
elseif ll == 2
    title('Y - Data');
elseif ll == 3
    title('Pressure - Data');
elseif ll == 4
    title('Time - Data');
end
hold on;

if DEBUG size(x),end

[laux,lmulti]=lmultigauss(x,mi(l,:),sig(l,:),c);
aux=exp(laux);
multi=exp(lmulti);

if DEBUG size(x),size(multi'),pause,end

hp=plot(x,multi','r','Linewidth',3);
%xlim([ -xM xM ]);                    

ha=get(gca,'Children');
%it seem that the bars are children number 4

set(ha(2),'FaceColor',[ 0.8 0.8 0.8 ]);
set(ha(2),'EdgeColor',[ 0.8 0.8 0.8 ]);%*
plot(x,aux);
end
