function traf=id2tf(m)

na=m.n(1);
nb=m.n(2);
nk=m.n(3);

difference= nb+nk-na; 

numerator=m.A;
denominator=[1;m.B];
if difference < 0 
    numerator= [m.A, zeros(difference,1)];
    
elseif difference > 0 
    denominator= [1 ; m.B ; zeros(difference ,1 )]; 
    
end


traf=tf(numerator', denominator',-1);
end