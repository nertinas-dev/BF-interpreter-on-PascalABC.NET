var
  data:array[1..30000]of integer;
  stack,pos,pos1,pos2:integer;
  f:textfile;ch:char;
procedure parse(st:string);
begin
  pos:=1;
  for var i:=1 to st.Length do
  begin
    case st[i] of
      '>':pos:=pos+1;
      '<':pos:=pos-1;
      '+':data[pos]+=1;
      '-':data[pos]-=1;
      '.':write(chr(data[pos]));
      ',':begin
        read(ch);
        data[pos]:=ord(ch);
      end;
      '[':begin
        stack+=1;
        pos1:=i+1;
      end;
      ']':begin
        stack-=1;
        if stack=0 then
        begin
          pos2:=i-1;
          while data[pos]<>0 do 
            parse(copy(st,pos1,pos2-pos1+1));
        end;
      end;
    end;
  end;
end;
begin
  reset(f,'bfcode.txt');
  writeln('Press Enter or input stdin');
  while not eof do
    parse(readlnstring(f));
  close(f);
end.