def split_files(input_file, trg_folder, delimiter_arg):
    infile = open(input_file, 'r')
    lines = infile.readlines()
    sql_file_ind = [i for i, x in enumerate(lines) if ('as\n' in x or 'as \n' in x)]
    sql_file_name = [x for i, x in enumerate(lines) if ('as\n' in x or 'as \n' in x)]
    print(sql_file_ind)
    print(sql_file_name)
    print(lines)
    for i in range(len(sql_file_ind)):
        start = i
        end = i + 1
        # print("start and ending points", start, end)
        start_file_index = sql_file_ind[start] + 2
        try:
            end_file_index = sql_file_ind[end]
        except IndexError:
            end_file_index = len(lines) - 1
        sql_filename = sql_file_name[i].split(" ")[1]
        outfile = open(trg_folder + "payments.spark", 'w')
        while start_file_index < end_file_index - 1:
            # print("sql file indexes", start_file_index, end_file_index)
            if lines[start_file_index] != "(\n" and lines[start_file_index] != ")\n":
                outfile.write(lines[start_file_index])
                # print(lines[start_file_index])
            start_file_index += 1
            # print(start_file_index)
        print("sql file name " + "payments_" + sql_filename + ".sql created")
"""
replace("select ", "SELECT ").
replace("from ", "FROM ")
.replace("where ", "WHERE ")
.replace("case ", "CASE ")
.replace("else ", "ELSE ")
.replace("end ", "END ")
.replace("as ", "AS ")
.replace("left outer join ", "LEFT OUTER JOIN ")
.replace("on ", "ON ")
.replace("group by ", "GROUP BY ")
.replace("order by ", "ORDER BY ")
.replace("and ", "AND")
"""
if __name__ == '__main__':
    #input_file = input("enter file name")
    split_files("/Users/nnalam/Downloads/sub_payments_6_may_presto.sql", "/Users/nnalam/Downloads/splitfiles/", '(')
