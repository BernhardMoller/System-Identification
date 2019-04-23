function m = arxfit(z, n)

na=n(1);
nb=n(2);
nk=n(3); 

  
 [x, y] = ARXstructor(z, n);
  
  m = LinRegress(x, y);
  m.Model = 'ARX';
  m.Label = sprintf('ARX [na=%d nb=%d nk=%d]', na,nb,nk);
  m.n = [na, nb, nk];
  m.A = m.Theta(1:na);
  m.B = m.Theta((na+1):end);

end 