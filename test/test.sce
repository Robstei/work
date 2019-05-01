response_matching = simple_matching;

begin;

begin_pcl;


array<int>idx1[80]; # Index for food pics
array<int>idx2[80]; # Index for neutral pics



array<int>ntrorder_pract[20] = {3,1,2,4,2,3,4,1,1,2,3,4,2,3,1,4,1,2,4,3};
array<int>ntridx_pract[20] = {1,2,1,2,5,3,4,1,3,2,2,3,4,5,5,5,4,3,1,4};

array<int>alcorder_tmp[80];
array<int>alcidx_tmp[80];
array<int>alcorder[80];
array<int>alcidx[80];

array<int>ntrorder_tmp[80];
array<int>ntridx_tmp[80];
array<int>ntrorder[80];
array<int>ntridx[80];

int dotside; #1: left, 2:right
int dotresp; #1: left, 2:right

int food_count = 0;      
int neutral_count = 0;

loop
	int i = 1
until
	i > 4
begin  
	loop
		int j = 1
	until
		j > 20
	begin 
		alcorder_tmp[(i-1)*20+j]=i;
		alcidx_tmp[(i-1)*20+j]=j;
		idx1[(i-1)*20+j] = (i-1)*20+j;
		ntrorder_tmp[(i-1)*20+j]=i;
		ntridx_tmp[(i-1)*20+j]=j;
		idx2[(i-1)*20+j] = (i-1)*20+j;
		j = j +1;
	end;
	i = i + 1;
end;

term.print("alcorder_tmp");
term.print(alcorder_tmp);
term.print_line("");

term.print("alcidx_tmp");
term.print(alcidx_tmp);
term.print_line("");

term.print("idx1");
term.print(idx1);
term.print_line("");

term.print("ntrorder_tmp");
term.print(ntrorder_tmp);
term.print_line("");

term.print("ntridx_tmp");
term.print(ntridx_tmp);
term.print_line("");

term.print("idx2");
term.print(idx2);
term.print_line("");

term.print_line(name.count());
sub
   string get_local_name( string name )
begin 
   int m = name.count();
   loop until
      m == 0
   begin
      if (name[m] == '\\' || name[m] == '/') then break end; 
      m = m - 1
   end;
   int sub_size = name.count() - m;
   if (sub_size != 0) then
      return name.substring( m + 1, name.count() - m )
   end;
   return ""
end;
