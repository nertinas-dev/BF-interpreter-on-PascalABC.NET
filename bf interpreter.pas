uses crt;
var
  s:String;
  data:array[1..30000]of integer;
  data1:array of char;
  stack,pos,pos1,pos2:integer;
  ch:char;f:textfile;
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
        data[pos]:=ord(readchar(ch));
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
  assign(f,'bfcode.txt');
  reset(f);
  writeln('Press Enter to run bfcode.txt');
  while not eof do
    parse(readlnstring(f));
  close(f);
end.