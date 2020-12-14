function but(x,y)
    U=[y-0.1 y-0.1];
    L=[y-0.9 y-0.9];
    x=[x-0.9 x-0.1];
    L=fliplr(L);y=fliplr(x);
    fill([x y],[U L],[198 198 198]/255)
end