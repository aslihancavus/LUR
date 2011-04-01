% onislem asamasi
clear all;  close all;  clc;
disp('data.mat olusturuluyor...');

dbg = true;
dbg2= false;

%dbnm = pathos('/mnt/db/gait/casia/datasetB/silhouettes/');
%dbnm = pathos('_db/casia/');
dbnm = pathos('C:\Documents and Settings\sony\Desktop\topla\GaitDatasetB-silh\DatasetB\silhouettes\');

pDIR = dir(dbnm);
pDIR= pDIR(3:end-1);
psz = length(pDIR);     if dbg2, psz = min(5, psz);  end

% afnm = strcat(dbnm, 'info.txt');    if ~exist(afnm), error('https://github.com/19/asid/raw/master/img/casiaB-gender-info.txt'); end
% cinsiyet = info2label(afnm, dbg);   

for pi = 1:psz
    if dbg, fprintf('%03d/%03d. kisi isleniyor...\n', pi, psz); end

    pdnm = strcat(dbnm, pDIR(pi).name);
    sDIR = dir(pathos(strcat(pdnm, '/nm-*')));
    ssz = length(sDIR);    if dbg2, ssz = min(5, ssz);  end

    for si=1:ssz
        if dbg, fprintf('\t%02d/%02d. seq isleniyor...\n', si, ssz);  end

        sdnm = pathos(strcat(pdnm, '/', sDIR(si).name, '/090/'));
        fDIR = dir(strcat(sdnm, '*.png'));
        fsz = length(fDIR);      if dbg2, fsz = min(5, fsz);  end

        for fi=1:fsz
            if dbg, fprintf('\t\t%02d/%02d. resim isleniyor...\n', fi, fsz);    end

            fnms{fi, si, pi} = strcat(sdnm, fDIR(fi).name);
            %etiket{fi,si,pi} = cinsiyet(str2num(pDIR(pi).name));

            if dbg,
                figure(1)
                im = imread(fnms{fi, si, pi});
                imshow(im); %title(char(etiket{fi,si,pi}));
            end
        end
    end
end

dfnm = pathos('_db/data.mat');
%save(dfnm, 'fnms', 'etiket');

% input('demo calistiriliyor (devam etmek icin ENTER)...');
% demo();
