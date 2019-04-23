function ySim= idsimulate(m, Z)


method = 'build_in';

switch method
    case 'build_in'
        H = id2tf(m);
        warning('off')
        ySim = lsim(H, Z(:,2), (1:size(Z, 1))');
        warning('on')
    otherwise
        n = size(Z, 1);
        ySim = zeros(n, 1);

        u = Z(:,2);
        for i = 1:n
            ui = u(1:i, 1);
            yi = ySim(1:i, 1);
            zi = [yi, ui];
            [X, ~] = arxinput(zi, m.n);
            yi_sim = X(end,:)*m.theta;
            ySim(i, 1) = yi_sim;
        end

end 