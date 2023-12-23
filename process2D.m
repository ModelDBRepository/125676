function A = process2D(fname, M);
% Process2D(fname,M) reads a multi-column data file
% into an MxK matrix, where M is the number of columns
% in fname, and K is the number of rows

global K;

f = fopen(fname,'r');
B = fscanf(f, '%f');

Dim = length(B);
K = Dim / M;
A = reshape(B,M,K);

