function [x,y]=bomb(n,A,B,D)                      %the function to produce the bomb
    x=randi([2 D-1],1);y=randi([2 D-1],1);
    for ii=1:n
        while and(x==A(ii),y==B(ii))
            [x,y]=bomb(n,A,B,D);
        end
    end
end