%{
   Lagrange interpolation *:
First insert your data as a matrix(a matrix for horizontal axes and another
for vertical axes(X, Y matrixes).
*(note that size of both matrixes should be equal.)
Then define the inputs that you want to interpolate(x) it can be a matrix
of data or just a number.
*(the range of x should be between the minimum and the maximum of the X arguments.)
Output y is a matrix that is the same size as x.
%}

function y = Lagrange_Interpolation(x,X,Y) % x input, X & Y data matrix for interpolation
    %% Error declaration(for size)
    if size(X,2) ~= size(Y,2) 
        error('size of X should be equal to Y');
    end
    %% Error declaration(for range)
    for i=1:size(x,2) 
        if x(i)>max(X)
            error('one of the input arguments are out of range');
        end
        if x(i)<min(X)
            error('one of the input arguments are out of range');
        end
    end
    %% calculation part
    y=zeros(1,size(x,2));   %output matrix

    n = size(X,2);
    L=zeros(1,n);   %Lagrange coefficient matrix:
    p1=1;                   %numerator of division in L,
    p2=1;                   %denominator of division in L.

    for i=1:size(x,2)   % i is for the counter of the input(x)
        if x(i)~=X(i)      % because if x(i)=X(i) then y(i)=Y(i)
            for j=1:n       % j is for the summation for output, and the calculation of coefficients.
                for k=1:n    % k is for computing each coefficient('L(j)').
                    if(k~=j)    % because there isn't any (x-Xj) or (Xj-Xj).
                        p1=(x(i)-X(k))*p1;      %(x-X1)(x-X2)...(x-Xn)
                        p2=(X(j)-X(k))*p2;      %(Xj-X1)(X-X2)...(X-Xn)
                    end
                end
                L(j)=p1/p2;
                p1=1;p2=1;
                y(i)=L(j)*Y(j)+y(i); % y(x)=L1*Y1+L2*Y2+...+Ln*Yn
            end
        else
            y(i)=Y(i); % if x(i)=X(i) then y(i)=Y(i)
        end
    end
end