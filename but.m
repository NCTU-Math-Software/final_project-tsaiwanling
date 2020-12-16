function but(x,y)
    U=[y-0.05 y-0.05];
    L=[y-0.95 y-0.95];
    x=[x-0.95 x-0.05];
    L=fliplr(L);y=fliplr(x);
    fill([x y],[U L],[255 219 237]/255)
end