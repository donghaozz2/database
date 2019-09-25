--Haoxiang Dong
-- 0850990
--A2
with
 ada.Text_IO; 
use
 Ada.Text_IO;
with
 ada.Integer_Text_IO; 
use
 Ada.Integer_Text_IO;
with
 ada.strings.unbounded; 
use
 ada.strings.unbounded;
with
 ada.strings.unbounded.Text_IO; 
use
 ada.strings.unbounded.Text_IO;
with
 ada.characters.handling;
use
 ada.characters.handling;


procedure a2 is



word:String(1..20);
len :  integer ;
startString:String(1..20);
DICT_FILE: constant String:= "/usr/share/dict/canadian-english-small";



-- node
type Str_Node;
    type Str_Ptr is access Str_Node;
    type Str_Node is
        record
            data: String(1..20):= (others => ' ');
            number:  integer := 0;
            next: Str_Ptr:= null;
end record;


-- list

    type Str_List is
        record
            head: Str_Ptr:= null;
            long:  integer := 0;

end record;

--///////////////////////////////////////////////


dc:Str_List;




function inputJumble return String is 
begin
	Put_Line("Enter the word:");
	Get_Line(startString,len);
	return(startString);
end inputJumble;


--///////////////

function buildLEXICON return Str_List is 

	fp: file_type;
	count:  integer := 0;
	line: String(1..20);
	lineLen:  integer ;
	
	head:Str_Ptr;
	newnode:Str_Ptr;
	old:Str_Ptr;
	dc2:Str_List;
begin
	
	open(fp, in_file, DICT_FILE);
	
	line:= (others => ' ');
	
	
	--head.Root:= new Str_Ptr;
	
	
	get_line(fp, line, lineLen);
	
	
	count:=1;
	
	head:= new Str_Node'(line, lineLen, null);
	
	old:=head;
	
	loop
		line:= (others => ' ');
	    exit when end_of_file(fp);
		get_line(fp, line, lineLen);
		
		
		newnode:= new Str_Node'(line, lineLen, null);
		
		old.next:=newnode;
		old:=newnode;
		count:=count+1;
	
	
	
	end loop;
	close(fp);
	dc2.head:=head;
	dc2.long:=count;
	return dc2;
	
end buildLEXICON;
--////////////////////////
procedure findAnagram(str3: String) is 
part:Str_Ptr;
str4: String(1..20);
nu:  integer ; 
time:  integer ; 
time2:  integer ; 
long2: integer ; 
long3: integer ; 
begin
	
	part:=dc.head;
	time:=0;
	nu:=dc.long;
	while time<nu loop
		str4:=part.data;
		

		time2:=1;
		long2:=len;
		long3:=part.number;
		if long3= len then			
		while time2 <= len loop

			if str3(time2) = str4(time2) then
					--	Put(time2);
				--Put(long2);
				if time2 = long2 then
				
					Put_Line("we find:");
					Put_Line(str4(1..len));
				end if;
				time2:=time2+1;
			else
				time2:=len+2;
			end if;
		end loop;
		end if;
		
		
		part:=part.next;
		time:=time+1;
	end loop;

end findAnagram;
--///////////////////

function swap(str2: in out String;i:  integer ;j:  integer ) return String is 
a: character;


begin

	a:=str2(i);
	str2(i):=str2(j);
	str2(j):=a;
	return str2;
end swap;






procedure generateAnagram (str1: in out String;l:  integer ;r: in out  integer ) is 
i :  integer ;
m :  integer ; 
begin

if l = r then
	--put_Line(str1(1..len));
	findAnagram(str1);
else
	
	i:=l;
	while i<=r loop
		str1:=swap(str1,l,i);--
		m:=l+1;
		generateAnagram(str1,m,r);--
		str1:=swap(str1,l,i);--
		i:=i+1;
	end loop;


end if;


end generateAnagram;

--////////////////////////////



--//////////////////////




choice:String(1..20);
endChoice:  integer ;
begin
 
	dc:=buildLEXICON;
	
	
	
	
	 loop
		word:= inputJumble;
	

	
		generateAnagram(word,1,len);
        Put_Line ("Do you want to play one more? y or n.");
        get_line(choice, endChoice);

       
        exit when choice(1..endChoice) = "n";
    end loop;


	--findAnagram(word);
	
	
 
end a2;
