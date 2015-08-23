function [ val ] = computeCohe( inMat, dir )
%--------------------------------------------------------------------------
% computeCohe: compute the coherence from the input matrix.
%--------------------------------------------------------------------------
% DESCRIPTION:
%  
% INPUT ARGUMENTS:
%   inMat, the input matrix
%   dir, direction, default is 'col', that is computing coherence on column
%   vector. It can be set as either 'col' or 'row'.
% OUTPUT ARGUMENTS:
%   the coherence val.
if strcmp( dir, 'row' )
    inMat = inMat';
end
val = 0;
for i = 1:size(inMat, 2)-1
    for j = (i+1):size(inMat, 2)
        cVal = abs( inMat(:, i)'*inMat(:, j) ) / ( norm(inMat(:, i))*norm(inMat(:, j)) );
        if cVal > val
            val = cVal;
        end
    end
end


