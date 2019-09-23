% created by Patrice Morrier, November 16, 2005
%%% modified by S.Yanushkevich, February 04, 2009
%% modified by A. Poursaberi on February 18, 2011

function matchingScore = match(dbMinutia,inputMinutia,dbSkel,inputSkel,threshold2)
warning off all


%%%the function's arguments are the database vector of minutiae and the
%%%submitted (probed) vector of minutiae to match them, as well as the database vector
%%%representing skeleton and the vector representing the skeleton of the submitted one.
%%%threshold2 is added as a parameter on Feb.04, 2009

se = ones(3);
dbMinutia = imdilate(dbMinutia, se); %%%dilates the grayscale image
%%% se is a 3x3 array of ones, so it dilates the image to 9 squares
 
inputMinutia = imdilate(inputMinutia, se);

dbMinutia = bwmorph(dbMinutia, 'Shrink', 'Inf'); %%% morphological operation of shrinking bdMinutia to points
%%% now the image dbMintia is logical
inputMinutia = bwmorph(inputMinutia, 'Shrink', 'Inf');
%%% now the image inputMintia is logical


matchingScore = score(dbMinutia ,inputMinutia,dbSkel,inputSkel,threshold2);
 
%--------------------------------------------------------------------------
function [matchingscore, nbElementInput, nbElement] = score(db, input,dbSkel,inputSkel,threshold2)
%%% this function computes the score for the original image in database and
%%% submitted one, as well as their skeletons
%%% threshold2 is added as argument

threshold = threshold2; %%%you may change the threshold 
%%% (for exmaple, threshold=12;) for you Lab exercise


nbElementDb = length(find(db ~= 0));
nbElementInput = length(find(input ~= 0));

[Dbdist, L] = bwdist(db); %%%computes the Euclidean distance of the binary image db
%%%and returns the matrices Dbdist and L;
%%% in L, each element is the linear index of the nearest nonzero pixel of db.
[R, C] = ind2sub([size(L)], L); %%%returns the arrays R and C containing the
 %%%   equivalent row and column subscripts corresponding to the  matrix L
 %%% for a matrix of the same size.  

[r, c] = find(input ~= 0); %returns the row and column indices of the nonzero entries in input
r = round(r);
c = round(c);
inputmatch=zeros(size(input,1),size(input,2));
dbmatch=zeros(size(db,1),size(db,2));
nbmatch = 0;
distot = 0;
for i = 1:length(r)
    
    temp = Dbdist(r(i), c(i));
    
    if  temp < threshold
        input(r(i),c(i))=0;
        inputmatch(r(i),c(i)) = 1;
        ind = L(r(i), c(i));
        db(R(ind), C(ind)) = 0;
        dbmatch(R(ind), C(ind)) = 1;
        nbmatch = nbmatch + 1;
        distot = distot + temp;
        [Dbdist, L] = bwdist(db);
        %%%fprintf('%d %d - %d %d\n', r(i), c(i), R(ind), C(ind));
    end
    
end
matchingscore = (2 * nbmatch)/(nbElementInput + nbElementDb);

xs = showsimilarity(dbSkel,inputSkel);
[x1,y1]= find(db);
[x2,y2]= find(dbmatch==1);
[x3,y3]= find(input==1);
[x4,y4]= find(inputmatch==1);

hold on, title('Minutiae')
plot(y1,x1,'sb','markersize',8),
plot(y2,x2,'*b','markersize',8),
plot(y3,x3,'or','markersize',8),
plot(y4,x4,'r*','markersize',8), axis ij
legend('Fp1 minutiae', 'Fp1 matched minutiae','Fp2 minutiae','Fp2 matched minutiae')
xlabel(['Matching Score: ',num2str(matchingscore)])
hold off
nbElement = (nbElementInput + nbElementDb);


fprintf('number of matched minutiae : %d\ndistance total computed : %d\n',nbmatch, distot);
fprintf('number of minutiae in input image : %d\n', nbElementInput);
fprintf('number of minutiae in database image : %d\n', nbElementDb);
%%%fprintf('Score for minutiae : %1.2g\n', matchingscore);


%--------------------------------------------------------------------------
function x = showsimilarity(db, input)

%%%%input = full(imcomplement(input)); %%% complement and fill in the matrix
input = imcomplement(full(input)); %modified by A.Poursaberi
%%%%db = full(imcomplement(db));
db = imcomplement(full(db)); %modified by A.Poursaberi

Color = db + 1;
[I, J] = find(input == 1);
 
for i = 1 : length(I)
    Color(I(i), J(i)) = 3;
end
  
map = [1 1 1;0.7 0 0;0 0 0];
x = ind2rgb(Color, map); %%%convert indexed image Color and corresponding map to rgb
figure, imshow(x),colormap gray

