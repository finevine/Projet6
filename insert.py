from os import getcwd, scandir
from os.path import join, splitext

# CREATE ITERATOR FOR FILES IN /MOOCKAROO
csv_folder = scandir(join(getcwd(), "Moockaroo"))
# APPEND IF .CSV
csv_files = [f for f in csv_folder if splitext(f)[-1] == ".csv"]
# CLOSE ITERATOR
csv_folder.close()

# OPEN AND CLEAN .SQL FILE
f = open("data_moockaroo_insert.sql","w+")
f.truncate(0)

# ITERATE IN CSV_FILES LIST
for file in csv_files:
    f.write(
        "\copy " + splitext(file.name)[0].lower() + 
        " FROM '"+ file.path +"' DELIMITER ',' CSV HEADER;\n"
        )

