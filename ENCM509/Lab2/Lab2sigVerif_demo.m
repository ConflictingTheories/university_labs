function Lab2sigVerif_demo(AUTHfile,FORGfile,train,comp)

% Lab2sigVerif_demo
% Svetlana Yanushkevich
% gmm_estimate.m, lmultigauss.m, graph_gmm.m, and lsum.m files are credited to J. Richiardi, EPFL
% Dec 19 2008 

%clear all
close all

disp('-------------------------------------------------------------------');
disp('              On-line signature verification demo');
disp('            Biometric Technologies Laboratory, UofC');
disp('-------------------------------------------------------------------');

%-----------load signatures  ---------------
%user_entry=input('Enter authentic signatures file name: ','s');
user_entry = AUTHfile;
auths=load(user_entry); auths=struct2array(auths);
numAuthSigs=length(auths);
%pause;
%disp('Press any key to continue');
%user_entry2=input('Enter forged signatures file name: ','s');
user_entry2 = FORGfile;
forged=load(user_entry2); forged=struct2array(forged);
numForgedSigs=length(forged);
numAS=num2str(length(auths)); 
numFS=num2str(length(forged));
disp(['You have loaded ' numAS ' authentic signatures']);
disp(['and ' numFS ' forged signatures ']);
%pause;

disp('You can display and compare the pressure and velocity for authentic and foged signatures (see Lab 1)');
disp('(Press any key to continue)');
%pause;

%-----------set up constants ---------------
%NUMTRAININGPATTERNS=5; % number of signature realisations to use for training the models
%NUMGCOMPONENTS=64;     % number of Gaussian mixture components in the GMM


%-----------load signatures  ---------------
%user_entry3=input('Enter the number of signatures used for training (usually half of the samples): ');
user_entry3 = train;
if user_entry3 < 2
elseif user_entry3 > numAuthSigs
    disp('Wrong number');
else 
    NUMTRAININGPATTERNS=user_entry3;  
end
%pause;
%disp('Press any key to continue');
%user_entry4=input('Enter the number of Gaussian components (1<N<80): ');
user_entry4 = comp;
if user_entry4 < 1
elseif user_entry3 > 64
    disp('Wrong number');
else 
NUMGCOMPONENTS=user_entry4; 
end

numNTP=num2str(NUMTRAININGPATTERNS); 
numNC=num2str(NUMGCOMPONENTS);


%-------------training the user model using EM algorithm on GMM-------------------------
disp('We will use these data for training the Gaussian Mixture Model');
disp(['The number of signatures for training is the first ' numNTP ' signatures from the set,']);
disp(['and the number of Gaussian mixture components is ' numNC ' (Press any key to continue)']);
%pause;

% gmm_estimate require conversion of the cell array to matrix.
[mu_train1,sigma_train1,c_train1]=gmm_estimate(cell2mat(auths(1,1:NUMTRAININGPATTERNS)),NUMGCOMPONENTS);

%[mu_train1,sigma_train1,c_train1]=gmm_estimate(auths(1,1:NUMTRAININGPATTERNS),NUMGCOMPONENTS);


disp('Training has been completed. To start testing, press any key)');
%pause;
%-------------------------testing against authentic and forged signatures-------------- 

disp('Testing with the remaining authentic data');
aScores=[];
for authIdx=NUMTRAININGPATTERNS:numAuthSigs
    [lYM,lY]=lmultigauss(auths{authIdx}, mu_train1,sigma_train1,c_train1);
    presScore=mean(lY);
    aScores=[aScores; presScore];
end

disp('Testing with the forged data');
fScores=[];
for forgIdx=1:numForgedSigs
    [lYM,lY]=lmultigauss(forged{forgIdx}, mu_train1,sigma_train1,c_train1);
    presScore=mean(lY);
    fScores=[fScores; presScore];
end

%-------------------------display scores for verification system-------------- 

disp('Authentic signatures scores')
aScores
disp('Forged signatures scores');
fScores

% assume score distribution is Gaussian and compute per-class statistics
aMu=mean(aScores)
fMu=mean(fScores)
aStd=std(aScores)
fStd=std(fScores)

disp(['Average of authentic scores: ' num2str(aMu)]);
disp(['Average of forgery scores: ' num2str(fMu)]);


% compute probability values corresponding to per-class distribution parameters

amx = max(aScores); fmx = max(fScores);
amn = min(aScores); fmn = min(fScores);
if amx > fmx
    mx = amx;
else
    mx = fmx;
end
if amn < fmn
    mn = amn;
else
    mn = fmn;
end
range=mn:0.01:mx; % range to plot
range=-45:0.01:-15; % range to plot
aProb=normpdf(range,aMu,aStd);
fProb=normpdf(range,fMu,fStd);

% Plot authentic and forgeries scores as well as their (assumed Gaussian)
% distribution
figure(67); hold on;
plot(range,aProb,'g','LineWidth',2); % plot distribution of authentic scores
plot(aScores,zeros(length(aScores),1),'gs','LineWidth',2); % plot authentic scores
plot(range,fProb,'r','LineWidth',2); % plot distribution of forgeries scores
plot(fScores,zeros(length(fScores),1),'r^','LineWidth',2); % plot forgeries scores

pause;