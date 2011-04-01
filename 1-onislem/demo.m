% demo
clear all;  close all;  clc

disp('DEMO MODU');
dbg = true;
dfnm = pathos('_db/data.mat');
load(dfnm);

psz = size(etiket, 3);

for pi=1:psz
    if dbg, fprintf('%03d/%03d. kisi isleniyor...\n', pi, psz); end
    
    ssz = cellsize(etiket, pi);
    
    for si=1:ssz
        if dbg, fprintf('\t%02d/%02d. seq isleniyor...\n', si, ssz);  end
       
        fsz = cellsize(etiket, pi, si);
        
        for fi=1:fsz
            if dbg, fprintf('\t\t%02d/%02d. resim isleniyor...\n', fi, fsz);    end
            
            if dbg,
                figure(1)       
                im = imread(fnms{fi, si, pi});
                imshow(im); %title(char(etiket{fi,si,pi}));
            end            
        end
    end
end

