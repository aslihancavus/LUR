% onislem asamasi
clear all;  close all;  clc;

dbg = true;

dbnm = pathos('/mnt/db/gait/casia/datasetB/silhouettes/');
pDIR = dir(dbnm);
pDIR= pDIR(3:end);
psz = length(pDIR);     if dbg, psz=3;  end

for pi = 1:psz
    if dbg, fprintf('%03d/%03d. kisi isleniyor...\n', pi, psz); end
    
    pdnm = strcat(dbnm, pDIR(pi).name);  
    sDIR = dir(pathos(strcat(pdnm, '/nm-*')));    
    ssz = length(sDIR);     if dbg, ssz=3;  end
    
    for si=1:ssz
        if dbg, fprintf('\t%02d/%02d. seq isleniyor...\n', si, ssz);  end
        
        sdnm = pathos(strcat(pdnm, '/', sDIR(si).name, '/090/'));
        fDIR = dir(strcat(sdnm, '*.png'));
        fsz = length(fDIR);     if dbg, fsz=3;  end

        for fi=1:fsz
            if dbg, fprintf('\t\t%02d/%02d. resim isleniyor...\n', fi, fsz);    end
            
            fnms{pi, si, fi} = strcat(sdnm, fDIR(fi).name);
            
            if dbg,
                figure(1)
                im = imread(fnms{pi, si, fi});
                imshow(im);
            end
        end
    end
end