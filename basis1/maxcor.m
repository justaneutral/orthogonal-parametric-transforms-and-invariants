function cmax = maxcor(seq1, seq2)

% MAXCOR Auto-/cross-correlation maxima for two binary sequences of equal length

% Ivan Goranov, 25Feb2009

N = length(seq1);
if N ~= length(seq2)
  cmax = 0;
  return;
end
seq1=N*seq1/sqrt(seq1'*seq1);
seq2=N*seq2/sqrt(seq2'*seq2);
%% Convert bits 0/1 to signal levels -1/+1
%seq1(seq1 == 0) = -1;
%seq2(seq2 == 0) = -1;

%% Construct twice as long sequences to correlate with
seq11 = [seq1; seq1];
seq12 = [seq1; seq2];
seq21 = [seq2; seq1];
seq22 = [seq2; seq2];

%% Evaluate auto-/cross-correlation maxima for offs > 0
cmax = zeros(2,2,2);
for offs = 1:N-1
  ac = abs(seq11(1+offs:N+offs)'*seq1);
  if cmax(1,1,1) < ac
    cmax(1,1,1) = ac;
  end

  ac = abs(seq12(1+offs:N+offs)'*seq1);
  if cmax(1,2,1) < ac
    cmax(1,2,1) = ac;
  end

  ac = abs(seq21(1+offs:N+offs)'*seq1);
  if cmax(2,1,1) < ac
    cmax(2,1,1) = ac;
  end

  ac = abs(seq22(1+offs:N+offs)'*seq1);
  if cmax(2,2,1) < ac
    cmax(2,2,1) = ac;
  end

  ac = abs(seq11(1+offs:N+offs)'*seq2);
  if cmax(1,1,2) < ac
    cmax(1,1,2) = ac;
  end

  ac = abs(seq12(1+offs:N+offs)'*seq2);
  if cmax(1,2,2) < ac
    cmax(1,2,2) = ac;
  end

  ac = abs(seq21(1+offs:N+offs)'*seq2);
  if cmax(2,1,2) < ac
    cmax(2,1,2) = ac;
  end

  ac = abs(seq22(1+offs:N+offs)'*seq2);
  if cmax(2,2,2) < ac
    cmax(2,2,2) = ac;
  end
end

cmax(:,:,1) = cmax(:,:,1)/(seq1'*seq1);
cmax(:,:,2) = cmax(:,:,2)/(seq2'*seq2);
