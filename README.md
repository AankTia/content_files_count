# content_files_count

This script used for case find out and compare File Content.

In This case, pass the folder's path, the script will return the number of files that have same content.
Example Scenario: There are 4 files, with content = 'abc', so the script will return content + number. In this case, got: 'abc 4'

Also can return the bigger numberof files if there are multiple files with this same content.
For example, if there 4 files with content 'abc' and 5 files with content 'ab', got return value:'ab 5'

### Command
In console: (`ruby content_file_count.rb './document'`)