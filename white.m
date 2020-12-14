function land=white(xx,yy,land,D)                 %if click is zero then open the nearing squares!
    X=[xx xx-1 xx-1 xx-1 xx xx xx+1 xx+1 xx+1];
    Y=[yy yy-1 yy yy+1 yy-1 yy+1 yy-1 yy yy+1];
    land(xx,yy,2)=1;
    for ii=2:length(X)
        if X(ii)>1&&X(ii)<D&&Y(ii)>1&&Y(ii)<D
            if land(X(ii),Y(ii),1)~=0
                land(X(ii),Y(ii),2)=1;
            end
            if and(land(X(ii),Y(ii),1)==0,land(X(ii),Y(ii),2)==0)
                land(X(ii),Y(ii),2)=1;
                land=white(X(ii),Y(ii),land,D);
            end
        end
    end
end