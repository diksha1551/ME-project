fprintf('This is Mohr Circle Representation.\n');

% Taking initial inputs from the user.
sig_x=input('Enter the value of sigma_x =');
sig_y=input('Enter the value of sigma_y =');
tau_xy=input('Enter the value of tau_xy =');

% Using the given values, compute the radius and center of the Mohr's
% Circle by using equation of circle. 

R=sqrt(((sig_x-sig_y)/2)^2 + (tau_xy)^2);
C=(sig_x + sig_y)/2;

% Computing maximum and minimum principle stress
sig_1 = C+R;
sig_2 = C-R;

% Defining a variable for normal stress using matrix representation.
sigma=linspace(sig_2,sig_1,1001);

% Evaluating the stear stress.
tau_1=sqrt(R^2 - (sigma-C).^2);
tau_2=-tau_1;

plot(sigma,tau_1,'b',sigma,tau_2,'b')

% Displaying the computed values
disp(R);
disp(C);
disp(sig_1);
disp(sig_2);

% Fixing the aspect ratio.
xlabel('Sigma')
ylabel('Tau')
axis('square')

hold on
% Add diameter for principal stress.
plot([sig_1, sig_2], [0,0], 'k')
% Add the diameter for initial stress state.
plot([sig_x, sig_y], [-tau_xy, tau_xy],'g')

grid on
