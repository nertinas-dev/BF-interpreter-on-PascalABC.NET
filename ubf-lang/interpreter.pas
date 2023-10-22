var
  data: array[1..30000]of integer;
  code: array of string;
  stack, stack2, pos, pos1, pos2: integer;
  f, f1, f2: textfile;ch: char;
  st:string;
procedure parse(st: string);
begin
  for var i := 1 to st.Length do
  begin
    case st[i] of
      '>': pos += 1;
      '<': pos -= 1;
      '+': data[pos] += 1;
      '-': data[pos] -= 1;
      '.': write(chr(data[pos]));
      ',':data[pos] := ord(readchar(ch));
      '@': //import(include)
        begin
          pos1:=i+1;
          for var w:=pos1 to st.Length do
          begin
            if st[w]=';' then
            begin
              pos2:=w-1;
              reset(f1,'modules\'+copy(st,pos1,pos2-pos1+1)+'.mubf');
              while not eof(f1) do
                parse(readlnstring(f1));
              close(f1);
            end;
          end;
        end;
      '{': //if
        begin
          stack2 += 1;
          pos1:=i+1;
            for var m:=pos1 to st.Length do
            begin
              case st[m] of
                '{':stack2+=1;
                '}':begin
                  stack2-=1;
                  if stack2=0 then
                  begin
                    pos2:=m-1;
                    if data[pos]=0 then
                      parse(copy(st,pos1,pos2-pos1+1))
                    else break;
                  end;
                end;
              end;
            end;
        end;
      '[':
        begin
          stack += 1;
          pos1:=i+1;
            for var j:=pos1 to st.Length do
            begin
              case st[j] of
                '[':stack+=1;
                ']':begin
                  stack-=1;
                  if stack=0 then
                  begin
                    pos2:=j-1;
                    while data[pos]<>1 do
                    parse(copy(st,pos1,pos2-pos1+1));
                end;
              end;
            end;
          end;
        end;
    end;
  end;
end;
begin
  pos := 1;
  reset(f2,'run.txt');
  readln(f2,st);
  code := readalllines(st);
  close(f2);
  for var w:=0 to code.Length-1 do
  begin
    if code[w].StartsWith('module ') then
    begin
      rewrite(f,'modules\'+code[w].TrimStart('m','o','d','u','l','e',' ')+'.mubf');
      for var x:=w+1 to code.Length do
      begin
        if code[x].StartsWith('%')then
          f.writeln(code[x].TrimStart('%')) else break;
      end;
      close(f)
    end else if code[w].StartsWith('%') then continue else
      parse(code[w]);
  end;
  halt;
end.