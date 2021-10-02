%MAIN

%It is main program to work with
%Other programs are function that this program uses
%There you can create your circuit and visualize it
%Also there is tests for Circuits 1 and 2 from the report
%Click "Run" to start

clear
clc

N = input('Input number of qubits:  ');
% Generating of N-qubit quantum state |0...0>
psi = [1;0];
for n = 2:N
    psi = kron(psi, [1;0]);
end

%Creating array of strings for visualisation of cicruit
circuit = '|0>-';
step = '-';
for i = 2:N
    circuit = [circuit; '|0>-'];
end
for i = 2:N
    step = [step; '-'];
end
empty_step = step;

%Choosing the algorithm of work
Alg = input('Choose algorithm:\n1 - New circuit\n2 - Circuit 1 (report)\n3 - Circuit 2 (report)\n4 - Bell states\n');

%Report circuit
if Alg == 2
    %Creating a |00> state
    psi = kron([1;0], [1;0]);
    
    %Generating visual circuit
    disp(' ');
    disp('Circuit:');
    step(1,1) = 'X';
    circuit = [circuit step empty_step];
    step = empty_step;
    step(1,1) = '*';
    step(2,1) = '+';
    circuit = [circuit step empty_step];
    step = empty_step;
    step(1,1) = 'X';
    circuit = [circuit step empty_step];
    step = empty_step;
    disp(circuit);
    
    %Generating different initial states and acting 
    psi1 = Circuit1(psi); %|00>
    psi2 = Circuit1(X(psi,2)); %|01>
    psi3 = Circuit1(X(psi,1)); %|10>
    psi4 = Circuit1(X(X(psi,1),2)); %|11>
    
    %Displaying results
    disp(' ');
    disp('Results:');
    disp(['|00> ->', qPrint(psi1)]);
    disp(['|01> ->', qPrint(psi2)]);
    disp(['|10> ->', qPrint(psi3)]);
    disp(['|11> ->', qPrint(psi4)]);
end

%Report circuit
if Alg == 4
    %Creating a |00> state
    psi = kron([1;0], [1;0]);
    
    %Generating visual circuit
    disp(' ');
    disp('Circuit:');
    step(1,1) = 'H';
    circuit = [circuit step empty_step];
    step = empty_step;
    step(1,1) = '*';
    step(2,1) = '+';
    circuit = [circuit step empty_step];
    step = empty_step;
    disp(circuit);
    
    %Generating different initial states and acting 
    psi1 = BELL(psi, 1, 2); %|00>
    psi2 = BELL(X(psi,2), 1, 2); %|01>
    psi3 = BELL(X(psi,1), 1, 2); %|10>
    psi4 = BELL(X(X(psi,1),2), 1, 2); %|11>
    
    %Displaying results
    disp(' ');
    disp('Results:');
    disp(['|00> ->', qPrint(psi1)]);
    disp(['|01> ->', qPrint(psi2)]);
    disp(['|10> ->', qPrint(psi3)]);
    disp(['|11> ->', qPrint(psi4)]);
end

if Alg == 3
    %Creating |00> state
    psi = kron([1;0], [1;0]);
    
    %Generating visual circuit
    disp(' ');
    disp('Circuit:');
    step(1,1) = 'H';
    step(2,1) = 'H';
    circuit = [circuit step empty_step];
    step = empty_step;
    step(1,1) = '*';
    step(2,1) = '+';
    circuit = [circuit step empty_step];
    step = empty_step;
    step(1,1) = 'H';
    step(2,1) = 'H';
    circuit = [circuit step empty_step];
    step = empty_step;
    disp(circuit);
    
    %Generating different initial states and acting
    psi1 = Circuit2(psi); %|00>
    psi2 = Circuit2(X(psi,2)); %|01>
    psi3 = Circuit2(X(psi,1)); %|10>
    psi4 = Circuit2(X(X(psi,1),2)); %|11>
    
    %Displaying results
    disp(' ');
    disp('Results');
    disp(['|00> ->', qPrint(psi1)]);
    disp(['|01> ->', qPrint(psi2)]);
    disp(['|10> ->', qPrint(psi3)]);
    disp(['|11> ->', qPrint(psi4)]);
end

%Algorithm for creating new circuit
%User inputs the chosen letter and number of cubit to place in the circuit
%Every gate can be placed in different locations and two-qubits gate has
%options of 2 qubits
%After every step you can continue or finish.
%Also you can choose to display the ket-vector state or full curcuit
choice = 1; 
if Alg == 1
    disp('Choose quantum gate:');
    disp('X, Y, Z, H - One-qubit gates');
    disp('CNOT, SWAP - Two-qubit gates');
    disp('CCNOT - Three-qubit gates');
    disp('BELL - Bell states creation algorithm');
    disp('2 - Display the circuit');
    disp('1 - Display the state');
    disp('help - Display the menu');
    disp('0 - Finish');
    while choice ~= '0'
        choice = input('Gate/Input:  ', 's');
        switch(choice)
            %Depening on choise there are different actions
            %In every case a new visual is created to describe circuit
            case 'X'
                qtarget = input('Qubit:  ');
                psi = X(psi,qtarget);
                step(qtarget,1) = 'X';
            case 'Y'
                qtarget = input('Qubit:  ');
                psi = Y(psi,qtarget);
                step(qtarget,1) = 'Y';
            case 'Z'
                qtarget = input('Qubit:  ');
                psi = Z(psi,qtarget);
                step(qtarget,1) = 'Z';
            case 'H'
                qtarget = input('Qubit:  ');
                psi = H(psi,qtarget);
                step(qtarget,1) = 'H';
            case 'CNOT'
                qcontrolling = input('Controlling qubit:  ');
                qcontrolled = input('Controlled qubit:  ');
                psi = CNOT(psi, qcontrolling, qcontrolled);
                step(qcontrolling,1) = '*';
                step(qcontrolled,1) = '+';
            case 'SWAP'
                q1 = input('First qubit:  ');
                q2 = input('Second qubit:  ');
                psi = SWAP(psi, q1, q2);
                step(q1,1) = 'X';
                step(q2,1) = 'X';
            case 'CCNOT'
                q3 = input('Controlled qubit:  ');
                psi = CCNOT(psi, q3);
                step(q3-2,1) = '*';
                step(q3-1,1) = '*';
                step(q3,1) = '+';
            case 'BELL'
                q1 = input('First qubit:  ');
                q2 = input('Second qubit:  ');
                psi = BELL(psi, q1, q2);
                step(q1,1) = 'H';
                circuit = [circuit step empty_step];
                step = empty_step;
                step(q1,1) = '*';
                step(q2,1) = '+';
            case 'help'
                disp('Choose quantum gate:');
                disp('X, Y, Z, H - One-qubit gates');
                disp('CNOT, SWAP - Two-qubit gates');
                disp('CCNOT - Three-qubit gates');
                disp('BELL - Bell states creation algorithm (2-qubit');
                disp('2 - Display the circuit');
                disp('1 - Display the state');
                disp('help - Display the menu');
                disp('0 - Finish');
            case '2'
                disp(circuit);
            case '1'
                disp(psi);
                if N <= 3
                    disp(qPrint(psi));
                end
            case '0'
                disp("Finished")
                disp(circuit);
                disp(psi);
                if N <= 3
                    disp(qPrint(psi));
                end
            otherwise
                disp('Wrong element');
        end
        circuit = [circuit step empty_step];
        step = empty_step;
        disp(' ');
            
    end
end        