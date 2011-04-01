function etiket = info2label(afnm, dbg)
% function etiket = info2label(afnm, dbg)
% 
% annotation file'indan (casia icin 'info.txt') etiket bilgileri (burada
% 'M' ve 'F') 'etiket' degiskeninde geri dondurulur.
% 
% IN:   afnm: dosya ismi
% OUT:  etiket: char dizisi

fid = fopen(afnm);
C = textscan(fid, '%d%s%d', 'Delimiter', ',', ...
             'CommentStyle', '#');
fclose(fid);

sID = C{1};
lbl = char(C{2});

etiket(sID) = lbl;