#!/usr/bin/raku

# In Raku (formerly Perl 6), file and path manipulation is handled mainly 
# by the IO::Path class, which offers methods for working with current file 
# paths, moving files, and various other path operations in an OS-independent 
# way.

# Here is an example of a `current.pm6` file that demonstrates how to get the 
# current file's path, move or rename a file, and work with paths elegantly 
# using methods provided by IO::Path:

# ```raku
# current.pm6

# Get the current working directory
my $cwd = '.'.IO.absolute;
say "Current directory: $cwd";

# Define source and destination files as IO::Path objects
my $source = 'oldfile.txt'.IO;
my $destination = 'newfile.txt'.IO;

# Move (rename) file using the move method
if $source.e {
    $source.move($destination);
    say "Moved $source to $destination";
} else {
    say "Source file does not exist.";
}

# Check if destination exists and print its absolute path
if $destination.e {
    say "Destination file exists at: " ~ $destination.absolute;
}

# Example of linking: create a symbolic link (if OS supports it)
# Note: requires permissions and support
try $destination.symlink('link_to_newfile.txt'.IO);
say "Created symbolic link to newfile.txt";

# More path operations can be done by chaining and combining IO::Path methods
# ```

# Key points:
# - `.IO` transforms a string path into an IO::Path object.
# - `.move` moves or renames files.
# - `.e` tests for existence.
# - `.absolute` gets the absolute path.
# - `.symlink` creates symbolic links if supported.
# - Handling errors can be done using `try`.

# This method directly uses Raku's standard IO handling capabilities in a clean, modern, and platform-agnostic way, offering very practical file management.

# This solution fits your request for current path handling, moving files, and managing links effectively in a file named `current.pm6` or similar.[1][3][4]

# [1](https://stackoverflow.com/questions/57782961/how-do-we-work-with-os-independent-paths-in-perl-6)
# [2](https://docs.raku.org/language/perl-func)
# [3](https://raku.github.io/Documentable/integration-test/language/io-guide)
# [4](https://andrewshitov.com/2018/10/31/working-with-files-and-directories-in-perl-6/)
# [5](https://raku.land/?q=PARSING)
# [6](https://www.evanmiller.org/a-review-of-perl-6.html)
# [7](https://perl6advent.wordpress.com/2010/12/03/day-3-file-operations/)
# [8](https://raku.guide)
# [9](https://raku-advent.blog/2019/12/01/day-1-raku-from-perl/)
