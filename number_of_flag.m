function d=number_of_flag(land,D,B)
    nflag=0;
    for xx=2:D-1
        for yy=2:D-1
            if land(xx,yy,2)==3
                nflag=nflag+1;                
            end
        end
    end
    d=text(D/2,D-0.5,num2str(B-nflag),'FontSize',20);
end