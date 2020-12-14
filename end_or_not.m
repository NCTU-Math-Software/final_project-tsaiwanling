function s=end_or_not(land)
    s=0;
    for ii=2:size(land,1)-1
        for jj=2:size(land,2)-1
            if land(ii,jj,2)==2
                s=s+1;
            end
        end
    end
end