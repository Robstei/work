response_matching = simple_matching;

begin;

array {
	picture{ bitmap{ filename="stimulus_sns_1.jpg"; }; x = 0; y = 0;  };
} pictures;
begin_pcl;

string picture_string_one = "sns";
bitmap tmp_bitmap = bitmap(pictures[1].get_part(1));
string filename = tmp_bitmap.filename();
int index = filename.find(picture_string_one);


term.print_line(index > 0);

