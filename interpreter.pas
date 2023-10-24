var
  data: array[1..30000]of integer;
  code: array of string;
  stack, stack2, pos, pos1, pos2, pos3, pos4: integer;
  f, f1, f2: textfile;
  st: string;

procedure parse(st: string);
begin
  for var i := 1 to st.Length do
    case st[i] of
      '>': pos += 1;
      '<': pos -= 1;
      '+':
        begin
          pos1 := i + 1;
          for var j := pos1 to st.Length do
            if st[j] not in '1234567890' then
            begin
              pos2 := j - 1;
              data[pos] += copy(st, pos1, pos2 - pos1 + 1).ToInteger;
              break;
            end;
        end;
      '-':
        begin
          pos1 := i + 1;
          for var j := pos1 to st.Length do
            if st[j] not in '1234567890' then
            begin
              pos2 := j - 1;
              data[pos] -= copy(st, pos1, pos2 - pos1 + 1).ToInteger;
              break;
            end;
        end;
      '.': write(chr(data[pos]));
      ',': data[pos] := ord(readchar);
      '@':
        begin
          pos1 := i + 1;
          for var j := pos1 to st.Length do
            if st[j] = ';' then
            begin
              pos2 := j - 1;
              reset(f1, 'modules\' + copy(st, pos1, pos2 - pos1 + 1) + '.mubf');
              while not eof(f1) do
                parse(readlnstring(f1));
              close(f1);
            end;
        end;
      '{':
        begin
          stack2 += 1;
          pos1 := i + 1;
          for var j := pos1 to st.Length do
            case st[j] of
              '{': stack2 += 1;
              '}':
                begin
                  stack2 -= 1;
                  if stack2 = 0 then
                  begin
                    pos2 := j - 1;
                    if data[pos] = 0 then
                      parse(copy(st, pos1, pos2 - pos1 + 1))
                    else break;
                  end;
                end;
            end;
        end;
      '[':
        begin
          stack += 1;
          pos1 := i + 1;
          for var j := pos1 to st.Length do
          begin
            case st[j] of
              '[': stack += 1;
              ']':
                begin
                  stack -= 1;
                  if stack = 0 then
                  begin
                    pos2 := j - 1;
                    while data[pos] <> 1 do
                      parse(copy(st, pos1, pos2 - pos1 + 1));
                  end;
                end;
            end;
          end;
        end;
    end;
end;

begin
  pos := 1;
  reset(f2, 'run.txt');
  readln(f2, st);
  code := readalllines(st);
  close(f2);
  for var w := 0 to code.Length - 1 do
    if code[w].StartsWith('module ') then
    begin
      rewrite(f, 'modules\' + code[w].TrimStart('m', 'o', 'd', 'u', 'l', 'e', ' ') + '.mubf');
      for var x := w + 1 to code.Length do
        if code[x].StartsWith('%') then
          f.writeln(code[x].TrimStart('%')) else break;
      close(f)
    end else if code[w].StartsWith('%') then continue else
    if code[w]=('file write ?props') then
    begin
      rewrite(f,'files\'+code[w+1]);
      f.Close;
      f.Append;
      for var x := w + 2 to code.Length-1 do
        if code[x].StartsWith('?') then
          f.Writeln(code[x].TrimStart('?')) else break;
      f.Close
    end else if code[w].StartsWith('?') then continue else
      parse(code[w]);
end.